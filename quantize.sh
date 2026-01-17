#!/bin/bash

model_id=$1
directory=$2
quant_type=${3:-q8_0}

if [ ! -d "$directory" ]; then
    echo "download model"
    docker-compose run --rm quantize python download.py --model_id $model_id --output_dir $directory
fi

echo "step 1: convert model to GGUF format (F16)"
docker-compose run --rm quantize python /opt/llama.cpp/convert_hf_to_gguf.py $directory --outfile ${directory}/model-f16.gguf --outtype f16

echo "step 2: quantize model to ${quant_type}"
docker-compose run --rm quantize llama-quantize ${directory}/model-f16.gguf ${directory}/model-${quant_type}.gguf ${quant_type}

echo "model quantize complete"
echo "output: ${directory}/model-${quant_type}.gguf"