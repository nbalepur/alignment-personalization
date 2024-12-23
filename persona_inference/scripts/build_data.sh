#!/bin/bash

# source ... -> activate your conda environment
conda activate persona

dataset_name="" # original dataset
run_name="default" # run name of personas
model="gpt-4o-mini" # model that generated personas
inference_split="BeaverTails" # inference split used to create personas
new_dataset_name="" # new name of the dataset

# API tokens
if [ -f ../.env ]; then
    export $(cat ../.env | xargs)
fi
hf_write_token="${HF_WRITE_TOKEN:-}"

python3 model/build_augmented_dataset.py \
--run_name="$run_name" \
--model="$model" \
--dataset_name="$dataset_name" \
--inference_split="$inference_split" \
--new_dataset_name="$new_dataset_name" \
--hf_write_token="$hf_write_token"