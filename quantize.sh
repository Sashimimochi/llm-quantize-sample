#/bin/bash

model_id=$1
directory=$2

if [ ! -d llama.cpp ]; then
echo "download repogitory"
    git clone git@github.com:ggerganov/llama.cpp.git
fi

if [ ! -d "$directory" ]; then
    echo "download model"
    docker-compose run --rm quantize python download.py --model_id $model_id --output_dir $directory
fi

echo "start quantize model"
docker-compose run --rm quantize python llama.cpp/convert.py $directory --outfile $model_id.gguf --outtype q8_0
echo "model quantize complete"