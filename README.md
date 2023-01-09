Exploring Adaptive Attention in Memory Transformer Applied to Coherent Video Paragraph Captioning
=====
PyTorch code for our BigMM paper "Exploring adaptive attention in memory transformer applied to coherent video paragraph captioning" Enhanced
by [Leonardo Vilela Cardoso](http://lattes.cnpq.br/6741312586742178), [Silvio Jamil F. Guimarães](http://lattes.cnpq.br/8522089151904453) and 
[Zenilton K. G. Patrocínio Jr](http://lattes.cnpq.br/8895634496108399), 


A coherent description is an final purpose regarding video captioning via a couple of sentences due to the fact it might also without delay have an effect on consistency and intelligibility. In this context, a paragraph describing a video is affected through the activities used to both produce its certain narrative or furnish some clues that can also assist decrease textual repetition. This work proposes a model named Adaptive Transformer that uses attention mechanisms to enhance a memory-augmented transformer. This new approach increases the coherence among the generated sentences, assessing data importance (about the video segments) contained in the self-attention and using that to improve readability. The obtained results show the potential of this new approach as it provides increased coherence among the various video segments, decreasing the repetition in the generated sentences and improving the description diversity in the activitynet datasets.

## Getting started
### Prerequisites
0. Clone this repository
```
# no need to add --recursive as all dependencies are copied into this repo.
git clone https://github.com/IMScience-PPGINF-PucMinas/Adaptive-Transformer.git
cd Adaptive-Transformer
```

1. Prepare feature files

Download features from Google Drive: [rt_anet_feat.tar.gz (39GB)](https://drive.google.com/file/d/1mbTmMOFWcO30PIcuSpYiZ1rqoy5ltE3A/view?usp=sharing) 
and [rt_yc2_feat.tar.gz (12GB)](https://drive.google.com/file/d/1mj76DwNexFCYovUt8BREeHccQn_z_By9/view?usp=sharing).
These features are repacked from features provided by [densecap](https://github.com/salesforce/densecap#annotation-and-feature). 
```
mkdir video_feature && cd video_feature
tar -xf path/to/rt_anet_feat.tar.gz 
tar -xf path/to/rt_yc2_feat.tar.gz 
```

2. Install dependencies
- Python 2.7
- PyTorch 1.1.0
- nltk
- easydict
- tqdm
- tensorboardX

3. Add project root to `PYTHONPATH`
```
source setup.sh
```
Note that you need to do this each time you start a new session.


### Training and Inference
We give examples on how to perform training and inference with Adaptive-Transformer.

0. Build Vocabulary
```
bash scripts/build_vocab.sh
```
`DATASET_NAME` can be `anet` for ActivityNet Captions or `yc2` for YouCookII.


1. Adaptive-Transformer training

The general training command is:
```
bash scripts/train.sh
```

To train our Adaptive-Transformer model on ActivityNet Captions:
```
bash scripts/train.sh anet
```

Training log and model will be saved at `results/anet_re_*`.  
Once you have a trained model, you can follow the instructions below to generate captions. 


2. Generate captions 
```
bash scripts/translate_greedy.sh anet_re_* val
```
Replace `anet_re_*` with your own model directory name. 
The generated captions are saved at `results/anet_re_*/greedy_pred_val.json`


3. Evaluate generated captions
```
bash scripts/eval.sh anet val results/anet_re_*/greedy_pred_val.json
```
The results should be comparable with the results we present at Table 2 of the paper. 
E.g., B@4 10.00; C 23.04 R@4 5.29.

## Citations
If you find this code useful for your research, consider cite one of our papers:
```
@inproceedings{cardoso2022exploring,
  title={Exploring adaptive attention in memory transformer applied to coherent video paragraph captioning},
  author={Cardoso, Leonardo Vilela and Guimaraes, Silvio Jamil F and Patrocinio, Zenilton KG},
  booktitle={2022 IEEE Eighth International Conference on Multimedia Big Data (BigMM)},
  pages={37--44},
  year={2022},
  organization={IEEE}
}

@inproceedings{cardoso2021enhanced,
  title={Enhanced-Memory Transformer for Coherent Paragraph Video Captioning},
  author={Cardoso, Leonardo Vilela and Guimaraes, Silvio Jamil F and Patroc{\'\i}nio, Zenilton KG},
  booktitle={2021 IEEE 33rd International Conference on Tools with Artificial Intelligence (ICTAI)},
  pages={836--840},
  year={2021},
  organization={IEEE}
}
```

## Others
This code used resources from the following projects: 
[emt](https://github.com/IMScience-PPGINF-PucMinas/EMT),
[mart](https://github.com/jayleicn/recurrent-transformer),
[transformers](https://github.com/huggingface/transformers), 
[transformer-xl](https://github.com/kimiyoung/transformer-xl), 
[densecap](https://github.com/salesforce/densecap),
[OpenNMT-py](https://github.com/OpenNMT/OpenNMT-py).

## Contact
Leonardo Vilela Cardoso with this e-mail: lvcardoso@sga.pucminas.br

