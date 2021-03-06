#!/bin/bash

set -x

DATAHOME=${@:(-2):1}
EXEHOME=${@:(-1):1}

SAVEPATH=${DATAHOME}/models/

mkdir -p ${SAVEPATH}

cd ${EXEHOME}

python train.py \
       -save_path ${SAVEPATH} \
       -log_home ${SAVEPATH} \
       -online_process_data \
       -train_src ${DATAHOME}/train/nyt_type_train_nocopy.txt.source.txt \
       -train_guide_src ${DATAHOME}/train/nyt_mention_train_nocopy.txt.source.txt \
       -src_vocab ${DATAHOME}/train/nyt_type_vocab.txt.20k \
       -guide_src_vocab ${DATAHOME}/train/nyt_mention_vocab_src.txt.20k \
       -train_bio ${DATAHOME}/train/train.txt.bio \
       -bio_vocab ${DATAHOME}/train/bio.vocab.txt \
       -train_feats ${DATAHOME}/train/train.txt.pos ${DATAHOME}/train/train.txt.ner ${DATAHOME}/train/train.txt.case \
       -feat_vocab ${DATAHOME}/train/feat.vocab.txt \
       -train_tgt ${DATAHOME}/train/nyt_type_train_nocopy.txt.target.txt \
       -tgt_vocab ${DATAHOME}/train/nyt_type_vocab_src.txt.20k \
       -layers 1 \
       -enc_rnn_size 512 \
       -brnn \
       -word_vec_size 300 \
       -dropout 0.5 \
       -batch_size 32 \
       -beam_size 1 \
       -epochs 60 \
       -optim adam \
       -learning_rate 0.001 \
       -gpus 0 \
       -curriculum 0 \
       -extra_shuffle \
       -start_eval_batch 198 \
       -eval_per_batch 198 \
       -halve_lr_bad_count 3 \
       -seed 12345 \
       -cuda_seed 12345 \
       -log_interval 10 \
       -dev_input_src ${DATAHOME}/dev/nyt_type_dev.txt.shuffle.dev.source.txt \
       -dev_guide_src ${DATAHOME}/dev/nyt_mention_dev.txt.shuffle.dev.source.txt \
       -dev_bio ${DATAHOME}/dev/dev.txt.shuffle.dev.bio \
       -dev_feats ${DATAHOME}/dev/dev.txt.shuffle.dev.pos ${DATAHOME}/dev/dev.txt.shuffle.dev.ner ${DATAHOME}/dev/dev.txt.shuffle.dev.case \
       -dev_ref ${DATAHOME}/dev/nyt_type_dev.txt.shuffle.dev.target.txt \
       -test_input_src ${DATAHOME}/test/nyt_type_test.txt.shuffle.test.source.txt \
       -test_guide_src ${DATAHOME}/test/nyt_mention_test.txt.shuffle.test.source.txt \
       -test_bio ${DATAHOME}/dev/dev.txt.shuffle.dev.bio \
       -test_feats ${DATAHOME}/dev/dev.txt.shuffle.dev.pos ${DATAHOME}/dev/dev.txt.shuffle.dev.ner ${DATAHOME}/dev/dev.txt.shuffle.dev.case \
       -test_ref ${DATAHOME}/test/nyt_type_test.txt.shuffle.test.target.txt \
       -ofn_prefix nyt_inj

