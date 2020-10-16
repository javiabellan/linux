<h1 align="center">Software</h1>

## In [Arch Linux](https://www.archlinux.org/packages)


#### Fonts

```bash
pacman -S ttf-nerd-fonts-symbols
pacman -S powerline-fonts
pacman -S awesome-terminal-fonts
```

#### General

```bash
pacman -S lsd                     # Modern ls with a lot of pretty colors and awesome icons
pacman -S zsh                     # A very advanced and programmable command interpreter (shell) for UNIX
pacman -S zsh-autosuggestions     # Fish-like autosuggestions for zsh
pacman -S zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
pacman -S zsh-theme-powerlevel10k # Powerlevel10k is a theme for Zsh
pacman -S git                     # The fast distributed version control system
pacman -S htop                    # Interactive process viewer
pacman -S nvtop                   # An htop like monitoring tool for NVIDIA GPUs
pacman -S tree                    # A directory listing program displaying a depth indented list of files
pacman -S openssh                 # Premier connectivity tool for remote login with the SSH protocol
pacman -S openssl                 # The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
pacman -S figlet                  # A program for making large letters out of ordinary text
pacman -S tldr                    # A collection of simplified and community-driven man pages.
pacman -S bc                      # An arbitrary precision calculator language
pacman -S aspell                  # A spell checker designed to eventually replace Ispell
```


#### Programming

```bash
pacman -S python-ipdb          # IPython-enabled pdb
pacman -S python-pyflakes      # A lint-like tool for Python to identify common errors quickly without executing code
pacman -S mypy                 # Optional static typing for Python 2 and 3
pacman -S python-tqdm          # Fast, Extensible Progress Meter
pacman -S jupyter-notebook     # The language-agnostic HTML notebook application for Project Jupyter
pacman -S jupyterlab           # JupyterLab computational environment
pacman -S vim                  # Vi Improved, a highly configurable, improved version of the vi text editor
pacman -S neovim               # Fork of Vim aiming to improve user experience, plugins, and GUIs
pacman -S make                 # GNU make utility to maintain groups of programs
pacman -S jq                   # Command-line JSON processor
```


#### Data Science

```bash
pacman -S hdf5                       # General purpose library and file format for storing scientific data
pacman -S opencv                     # Open Source Computer Vision Library (Main modules package)
pacman -S opencv-samples             # Open Source Computer Vision Library
pacman -S graphviz                   # Graph visualization software
pacman -S python-numpy               # Matrix manipulation
pacman -S python-scipy               # Scientific library for Python. Sparse matrices support
pacman -S python-pandas              # Deal with data
pacman -S python-scikit-learn        # Machine learning
pacman -S python-matplotlib          # Visualization
pacman -S python-seaborn             # Visualization
pacman -S python-nltk                # Natural language processing in Python
pacman -S python-pytorch-opt-cuda    # Pytorch
pacman -S python-tensorflow-opt-cuda # Tensorflow
```

#### Data Science (PIP)

```bash
## EDA
pip install pandas-profiling[notebook]
pip install sweetviz

## Deep Learning
pip install fastai                  # Simplifies training fast and accurate neural nets using modern best practices
pip install captum                  # Model Interpretability for PyTorch
pip install pytorch-metric-learning # Learn if pairs (o triplets) are the same. Useful for few samples
pip install kornia                  # Computer Vision Library for PyTorch
pip install torch-optimizer         # Collection of optimizers for PyTorch compatible with optim module
pip install efficientnet-pytorch    # EfficientNet models (B0, B1,..., B7)
pip install albumentations          # Image agumaetations based in openCV

## Machine Laerning
pip install pycaret         # ML library extension of sklearn (muchas cosas)
pip install mlxtend         # ML library extension of sklearn (algunas cosas)
pip install kaggler         # ML library extension of sklearn (pocas cosas)
pip install optuna          # Hyperparameters optimization
pip install hyperopt        # Hyperparameters optimization
pip install scikit-optimize # Hyperparameters optimization
pip install yellowbrick     # ML Visualization
pip install scikit-plot     # ML Visualization
pip install shap            # ML Interpretability
pip install tsfresh         # Temporal series feature generation
pip install featuretools    # feature generation when multiples tables
pip install iterative-stratification # Used for multilabel targets

## Machine Laerning Models
pip install ngboost
pip install rgf_python
pip install umap-learn    # UMAP model for DimRed

# Computer Vision
pip install opencv-contrib-python   # Main and Extra/Contrib modules
```


## In [AUR](https://aur.archlinux.org/packages)

### Manually
1. Download package folder with `PKGBUILD` file
2. Inside the folder, build it via `$ makepkg`
3. Install it via `$ pacman -U packagename.pkg.tar.xz`

### With yay
1. Install yay
   - `git clone https://aur.archlinux.org/yay.git`
   - `cd yay`
   - `makepkg -si`
2. Use yay
```bash
yay -S google-chrome        # The popular and trusted web browser by Google (Stable Channel)
yay -S gotop                # A terminal based graphical activity monitor inspired by gtop and vtop
```




# 🐍 Python Packages

> ### See more Python AI packages [here](https://skymind.ai/wiki/python-ai)


### Index


| 🐼 **Dataframe** |  📊 **Visualization** | 💡 **Machine Learning** | 🌳 **Gradient Boosting** | 🔦 **Deep Learning** |
|:-----------------|:----------------------|:-------------------------|:-------------------------|:---------------------|
| Pandas           | Matplotlib            | Scikit learn             | XGBoost                  | Pytorch = PT         |
| Datatable        | Seaborn               | H2O                      | LightGBM                 | Tensorflow = TF      |
| CuDF             | Plotly                | CuML                     | CatBoost                 | Fast.ai (PT)         |
| Dask             | Bokeh                 | Dask-ML                  | ngboost                  | Catalyst (PT)        |
|                  | Altair                |                          |                          | Ignite (PT)          |
|                  |                       |                          |                          | Keras (TF)           |

Others:

| 🕷️ **Web Scraping** | 🔢 **Numeric** | 🍹 **Auto ML** | ❓ **ML visual** |
|---------------------|----------------|-----------------|------------------|
| Beautiful Soup      | Numpy          | H2O             | ELI5             |
| Scrapy              | Scipy          | Auto Sklearn    | Yellowbrick      |
|                     | Statsmodels    | TPOT            | Tensorboard (DL) |
|                     |                | MLBox           |                  |


### Data Manipulation & Wrangling

- [agate](): data analysis library with human-readable code
- [arrow](): date & time manipulation & formatting
- [beautifulsoup4](): Beautiful Soup, for parsing HTML, JSON & XML data
- [engarde](): defensive data analysis
- [jsonify](): converts .csv files to .json
- [numexpr](): fast numerical array expression evaluator
- [numpy](): scientific computing library
- [pandas](): data structures & data analysis tools
- [pandas_profiling](): generates profile reports from a pandas DataFrame
- [pandasql](): queries pandas dataframes using SQL syntax
- [prettytable](): easily display tabular data as ASCII table
- [shapely](): manipulation & analysis of geometric objects
- [tabulate](): pretty-print tabular data


### Machine Learning & Statistics

- [cvxopt](): convex optimization library
- [emcee](): an MIT MCMC library
- [hdbscan](): Hierarchical Density-Based Spatial Clustering of Applications with Noise
- [keras](): high-level neural networks API
- [lifelines](): survival analysis in Python
- [lifetimes](): package for analyzing user behavior
- [prophet](): procedure for forecasting time series data
- [pymc3](): probabilistic programming & Bayesian modeling
- [gensim](): unsupervised semantic modeling from plain text
- [scikit-image](): image processing library
- [scikit-learn](): tools for data mining & analysis
- [scikits-bootstrap](): bootstrap confidence interval algorithms for scipy
- [scipy](): for mathematics, science & engineering
- [statsmodels](): estimate statistical models & perform statistical tests
- [sympy](): symbolic mathematics
- [tensorflow](): numerical computation using data flow graphs
- [xgboost](): optimized distributed gradient boosting library


### Visualization

- [folium](): build Leaflet.js maps in Python
- [gviz_api](): helper library for Google Visualization API
- [igraph](): network analysis tools
- [mapbox](): client for Mapbox web services
- [matplotlib](): 2D plotting library
- [patsy](): describe statistical models & build design matrices
- [plotly](): create interactive graphics
- [pygal](): create interactive svg charts
- [pygraphviz](): interface for Graphviz graph layout & visualizations
- [pyproj](): cartographic transformations & geodetic computations
- [seaborn](): viz library to draw statistical graphics
- [squarify](): implementation of the squarify treemap layout algorithm
- [wordcloud](): wordcloud generator in Python


### Everything Else

- [cufflinks](): bind Plotly directly to pandas dataframes
- [datascience](): library for introductory data science
- [fiona](): read & write geospatial data files
- [geopandas](): extends pandas to allow spatial operations on geometric types
- [networkx](): create, manipulate & study networks
- [nltk](): natural language toolkit
- [pysal](): geospatial analysis library
- [pyzipcode3](): query zip codes & location data
- [requests](): allows HTTP requests
- [scrapy](): scraping web pages
- [six](): Python 2 & 3 compatibility library
- [spacy](): advanced natural language processing
- [textblob](): simple API for common NLP tasks
- [ua_parser](): fast & reliable user agent parser
- [urllib3](): HTTP client for python

---



# NLP Packages

```bash
spacy              # Parse trees, execelent tokenizer (8 languages).
gensim             # Semantic analysis, topic modeling and similarity detection.
NLTK               # Very broad NLP library. Not SotA.
SentencePiece      # Unsupervised text tokenizer by Google.
TorchText          # Pytorch NLP subpackage.
fasttext           # Word vector representations and sentence classification (157 languages)
huggingface        # Pretrained transformers in Pytorch and Tensorflow
fast-bert          # Super easy library for BERT based models
stanfordnlp        # Pretrained models for 53 languages.
PyText
allennlp           # An open-source NLP research library, built on PyTorch.
farm               # Fast & easy NLP transfer learning for the industry.
transfernlp        # NLP library designed for reproducible experimentation management.
flair              # A very simple framework for state-of-the-art NLP.
nlparchitect       # SotA NLP deep learning topologies and techniques.
finetune           # Scikit-learn style model finetuning for NLP.
```
