# LLM Quantize Sample

## What's me ?

HuggingFace で公開されているモデルを量子化するためのサンプルスクリプト

## Usage

Model ID と出力先を指定して実行する。

以下は楽天のモデルを例に量子化する。

HuggingFace のページにアクセスすると Model ID が取得できる。

https://huggingface.co/Rakuten/RakutenAI-7B-chat

![](./images/model_id.png)

```bash
$ sh quantize.sh Rakuten/RakutenAI-7B-chat Rakuten
download repogitory
download model
Wrote Rakuten/RakutenAI-7B-chat.gguf
model quantize complete
$ ls -lh Rakuten/ | grep Rakuten
-rw-r--r-- 1 root root 7.3G Apr 24 02:41 RakutenAI-7B-chat.gguf
```

## References

https://github.com/ggerganov/llama.cpp/discussions/2948
