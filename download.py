import argparse
from huggingface_hub import snapshot_download

def main():
    parser = argparse.ArgumentParser(description="")    
    parser.add_argument("--model_id", type=str, help="HuggingFace上のモデルのID ex. lmsys/vicuna-13b-v1.5", required=True)
    parser.add_argument("--output_dir", type=str, help="出力ディレクトリ名", required=True)
    args = parser.parse_args()

    model_id = args.model_id
    output_dir = args.output_dir

    snapshot_download(
        repo_id = model_id,
        local_dir = output_dir,
        local_dir_use_symlinks = False,
        revision = "main"
    )

if __name__ == "__main__":
    main()
