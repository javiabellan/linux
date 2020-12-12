<h1 align="center">Software for Arch Linux</h1>

## [Official Arch packages](https://www.archlinux.org/packages)

#### Fonts

```bash
sudo pacman -S ttf-nerd-fonts-symbols
sudo pacman -S powerline-fonts
sudo pacman -S awesome-terminal-fonts
```

#### General

```bash
sudo pacman -S lsd                     # Modern ls with a lot of pretty colors and awesome icons
sudo pacman -S zsh                     # A very advanced and programmable command interpreter (shell) for UNIX
sudo pacman -S zsh-autosuggestions     # Fish-like autosuggestions for zsh
sudo pacman -S zsh-syntax-highlighting # Fish shell like syntax highlighting for Zsh
sudo pacman -S zsh-theme-powerlevel10k # Powerlevel10k is a theme for Zsh
sudo pacman -S git                     # The fast distributed version control system
sudo pacman -S htop                    # Interactive process viewer
sudo pacman -S nvtop                   # An htop like monitoring tool for NVIDIA GPUs
sudo pacman -S tree                    # A directory listing program displaying a depth indented list of files
sudo pacman -S openssh                 # Premier connectivity tool for remote login with the SSH protocol
sudo pacman -S openssl                 # The Open Source toolkit for Secure Sockets Layer and Transport Layer Security
sudo pacman -S figlet                  # A program for making large letters out of ordinary text
sudo pacman -S tldr                    # A collection of simplified and community-driven man pages.
sudo pacman -S bc                      # An arbitrary precision calculator language
sudo pacman -S aspell                  # A spell checker designed to eventually replace Ispell
```


#### Programming

```bash
sudo pacman -S mypy             # Optional static typing for Python 2 and 3
sudo pacman -S jupyter-notebook # The language-agnostic HTML notebook application for Project Jupyter
sudo pacman -S jupyterlab       # JupyterLab computational environment
sudo pacman -S vim              # Vi Improved, a highly configurable, improved version of the vi text editor
sudo pacman -S neovim           # Fork of Vim aiming to improve user experience, plugins, and GUIs
sudo pacman -S make             # GNU make utility to maintain groups of programs
sudo pacman -S jq               # Command-line JSON processor
sudo pacman -S jre-openjdk      # Java Runtime Environment (JRE) ofrecido por OpenJDK
sudo pacman -S jdk-openjdk      # Java Development Kit (JDK) ofrecido por OpenJDK
```


```bash
sudo pacman -S python-pip           # The PyPA recommended tool for installing Python packages
sudo pacman -S python-ipdb          # IPython-enabled pdb
sudo pacman -S python-pyflakes      # A lint-like tool for Python to identify common errors quickly without executing code
sudo pacman -S python-tqdm          # Fast, Extensible Progress Meter
sudo pacman -S python-tabulate      # Pretty-print tabular data in Python, a library and a command-line utility.
sudo pacman -S python-requests      # Python HTTP for Humans
sudo pacman -S python-colorama      # Python API for cross-platform colored terminal text.
sudo pacman -S python-future        # Clean single-source support for Python 3 and 2
sudo pacman -S python-pykerberos    # High-level interface to Kerberos
```

#### Data Science

```bash
sudo pacman -S hdf5                       # General purpose library and file format for storing scientific data
sudo pacman -S opencv                     # Open Source Computer Vision Library (Main modules package)
sudo pacman -S opencv-samples             # Open Source Computer Vision Library
sudo pacman -S graphviz                   # Graph visualization software (necesario para pintar arboles de decision)
sudo pacman -S python-pydot               # Python interface to Graphviz's Dot
sudo pacman -S python-numpy               # Matrix manipulation
sudo pacman -S python-scipy               # Scientific library for Python. Sparse matrices support
sudo pacman -S python-pandas              # Deal with data
sudo pacman -S python-xlrd                # Library to extract data from Microsoft Excel spreadsheet files
sudo pacman -S python-scikit-learn        # Machine learning
sudo pacman -S python-matplotlib          # Visualization
sudo pacman -S python-seaborn             # Visualization
sudo pacman -S python-nltk                # Natural language processing in Python
sudo pacman -S python-pytorch-opt-cuda    # Pytorch
sudo pacman -S python-tensorflow-opt-cuda # Tensorflow
sudo pacman -S tensorboard                # TensorFlow's Visualization Toolkit
```


## [Arch User Repository (AUR)](https://aur.archlinux.org/packages)

|                                     | Manually           | yay (AUR Helper)    |
|:-----------------------------------:|--------------------|--------------------|
| Preparation<br>(install yay)        |                    | `sudo pacman -S --needed base-devel git`<br>`git clone https://aur.archlinux.org/yay.git`<br>`cd yay`<br>`makepkg -si` |
| Install<br>some package<br>(chrome) | `git clone https://aur.archlinux.org/google-chrome.git`<br>`cd google-chrome`<br>`makepkg -si` | `yay -S google-chrome` |
| Upgrade<br>some package<br>(chrome) | `cd google-chrome`<br>`git pull`<br>`makepkg -si` | `yay -Syu` |

#### Desktop apps

```bash
yay -S google-chrome        # The popular and trusted web browser by Google (Stable Channel)
yay -S sublime-text-3       # Sophisticated text editor for code, html and prose - stable build
yay -S spotify              # A proprietary music streaming service
yay -S zoom                 # Video Conferencing and Web Conferencing Service	edh
yay -S teams                # Microsoft Teams for Linux is your chat-centered workspace in Office 365
yay -S teamviewer           # All-In-One Software for Remote Support and Online Meetings
```

#### Terminal apps

```bash
yay -S gotop                # A terminal based graphical activity monitor inspired by gtop and vtop
```


## In [PIP](https://pypi.org)

Para no mezclar con los paquetes de python del sistema alojados en (`/usr/lib/python3.8`) mejor instalar los paquetes de pip en el directorio del usuario con el flag `--user` (`~/.local/lib/python3.8/site-packages/`).

#### EDA
```bash
pip install --user altair            # A declarative statistical visualization library for Python.
pip install --user plotly            # An open-source, interactive data visualization library for Python.
pip install --user cufflinks         # Productivity Tools for Plotly + Pandas.
pip install --user missingno         # Missing data visualization module for Python.
pip install --user dython            # A set of data tools in Python (Better correlation matrix).
pip install --user phik              # Phi_K correlation analyzer library
pip install --user pyod              # Python Outlier Detection (Anomaly Detection)
pip install --user wordcloud         # A little word cloud generator
pip install --user sweetviz          # A pandas-based library to visualize and compare datasets.
pip install --user pandas-profiling  # Generate profile report for pandas DataFrame
```

#### Deep Learning
```bash
pip install --user fastai                  # Simplifies training fast and accurate neural nets using modern best practices
pip install --user captum                  # Model Interpretability for PyTorch
pip install --user pytorch-metric-learning # Learn if pairs (o triplets) are the same. Useful for few samples
pip install --user kornia                  # Computer Vision Library for PyTorch
pip install --user torch-optimizer         # Collection of optimizers for PyTorch compatible with optim module
pip install --user efficientnet-pytorch    # EfficientNet models (B0, B1,..., B7)
pip install --user albumentations          # Image agumaetations based in openCV
pip install --user tensorflow-addons
```

#### Machine Learning
```bash
pip install --user mlxtend         # ML library extension of sklearn (algunas cosas)
pip install --user kaggler         # ML library extension of sklearn (pocas cosas)
pip install --user mlflow          # Tracking experiments
pip install --user wandb           # Tracking experiments
pip install --user optuna          # A hyperparameter optimization framework
pip install --user hyperopt        # Hyperparameters optimization
pip install --user scikit-optimize # Hyperparameters optimization
pip install --user yellowbrick     # ML Visualization
pip install --user scikit-plot     # ML Visualization (lift and gain charts)
pip install --user shap            # ML Interpretability
pip install --user tsfresh         # Temporal series feature generation
pip install --user featuretools    # Automated feature generation when multiples tables.
pip install --user iterative-stratification # Used for multilabel targets
```

#### Auto Machine Learning
```bash
pip install --user h2o              # H2O, Fast Scalable Machine Learning, for python
pip install --user pycaret          # An open source, low-code machine learning library in Python.
pip install --user mljar-supervised # Automates Machine Learning Pipeline with Feature Engineering and Hyper-Parameters Tuning
pip install --user tpot             # Tree-based Pipeline Optimization Tool using genetic programming.
```

#### Machine Learning Models
```bash
pip install --user xgboost       # XGBoost (CPU & GPU)
pip install --user catboost      # Catboost (CPU & GPU)
pip install --user lightgbm      # lightgbm (CPU version)
pip install --user ngboost       # Library for probabilistic predictions via gradient boosting.
pip install --user rgf_python    # Scikit-learn Wrapper for Regularized Greedy Forest
pip install --user umap-learn    # UMAP model for DimRed
pip install --user kmodes        # k-modes and k-prototypes clustering algorithms for clustering categorical data.

pip install --user lightgbm --install-option=--gpu  # lightgbm (GPU version)
pip install --user lightgbm --install-option=--gpu --install-option="--opencl-include-dir=/usr/local/cuda/include/" --install-option="--opencl-library=/usr/local/cuda/lib64/libOpenCL.so"
```

#### Computer Vision
```bash
pip install --user opencv-contrib-python   # Main and Extra/Contrib modules
```

#### NLP
```bash
pip install --user textblob  # Pythonic text processing. Sentiment analysis, part-of-speech tagging, noun phrase parsing, and more.
pip install --user gensim    # Python framework for fast Vector Space Modelling
pip install --user spacy     # Industrial-strength Natural Language Processing (NLP) in Python
```





---

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
