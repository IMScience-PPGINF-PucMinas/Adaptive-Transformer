#!/usr/bin/env bash
res_dir=$1
split_name=$2
sel_video=$3
python src/translate_test.py \
--res_dir=${res_dir} \
--eval_splits=${split_name} \
--sel_video=${sel_video} \
--min_sen_len=6 \
--max_sen_len=32 \
--batch_size=100 \
${@:4}
