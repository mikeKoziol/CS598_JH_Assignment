\<p align="center"\>
\<img src="[https://github.com/BaranziniLab/KG\_RAG/assets/42702311/0b2f5b42-761e-4d5b-8d6f-77c8b965f017](https://www.google.com/search?q=https://github.com/BaranziniLab/KG_RAG/assets/42702311/0b2f5b42-761e-4d5b-8d6f-77c8b965f017)" width="450"\>
\</p\>

# CS 598 JH Assignment: Enhancing KG-RAG for Biomedical Question Answering

This assignment requires you to set up, replicate, and enhance the **KG-RAG (Knowledge Graph-based Retrieval Augmented Generation)** framework. You will start by reproducing the baseline results using the `gemini-2.0-flash` model, then design and evaluate three distinct improvement strategies.

## Assignment Instructions

### **Step 1: Set Up the Environment**

First, prepare your local environment by cloning the repository, creating a virtual environment, installing dependencies, and running the setup script.

```bash
# Clone the repository
git clone <repository_url>
cd KG_RAG

# Create and activate a conda virtual environment
conda create -n kg_rag python=3.10.9
conda activate kg_rag

# Install the required packages
pip install -r requirements.txt

# Run the setup script to create the disease vector database
python -m kg_rag.run_setup
```

### **Step 2: Update Your Google API Key**

Configure your Google API key to use the Gemini model. The recommended LLM for this assignment is **Gemini-2.0-flash**, which is used for Disease Entity Extraction and Answer Generation.

  * **Get Your API Key**: You can set up your API key for free by visiting [this link](https://makersuite.google.com/app/apikey)
  * **Free Credits & Rate Limits**: While there are free credits available, please be aware of the daily rate limits. Plan your project schedule accordingly to avoid interruptions.
  * **Update Config File**: Add your API key to the `gpt_config.env` file.

### **Step 3: Replicate the Baseline Model**

Run the following script to generate results using the baseline KG-RAG implementation with `gemini-2.0-flash`.

```bash
sh run_gemini.sh
```

### **Step 4: Evaluate the Baseline**

Execute the evaluation script to measure the performance of the baseline model.

```bash
python data/my_results/evaluate_gemini.py
```

### **Step 5: Implement Enhancement Strategies**

This is the core of the assignment. You are required to implement **3 distinct improvement strategies** in the [**`kg_rag/rag_based_generation/GPT/run_mcq_qa.py`**](kg_rag/rag_based_generation/GPT/run_mcq_qa.py) file.

We have left TODO sections for `Mode 1`, `Mode 2`, and `Mode 3` in the code as placeholders for your implementations.

### **Step 6: Evaluate Your Enhancements**

Evaluate the performance of each of your proposed strategies.

1.  Ensure your enhanced model variant saves its output to a new file path.
2.  Open the evaluation script at [**`data/my_results/evaluate_gemini.py`**](data/my_results/evaluate_gemini.py) and modify the file path to point to your new results file.
3.  Run the script again and record the results for each of your three strategies.

-----

## What is KG-RAG?

KG-RAG is a task-agnostic framework that combines the explicit knowledge of a Knowledge Graph (KG) with the implicit knowledge of a Large Language Model (LLM). It empowers a general-purpose LLM by incorporating an optimized, domain-specific **'prompt-aware context'** extracted from a massive biomedical KG called [SPOKE](https://spoke.ucsf.edu/).

The main feature of KG-RAG is that it extracts the minimal context sufficient to respond to the user prompt, making the information provided to the LLM both dense and highly relevant.

\<video src="[https://github.com/BaranziniLab/KG\_RAG/assets/42702311/86e5b8a3-eb58-4648-95a4-271e9c69b4ed](https://www.google.com/search?q=https://github.com/BaranziniLab/KG_RAG/assets/42702311/86e5b8a3-eb58-4648-95a4-271e9c69b4ed)" controls="controls" style="max-width: 730px;"\>
\</video\>

-----

## Example use case of KG-RAG

The following example shows how KG-RAG provides more accurate, context-aware answers for a specialized biomedical query compared to a standard LLM prompt. The query is about the drug **"setmelanotide,"** which was approved by the FDA for treating *Bardet-Biedl Syndrome*.

### **WITHOUT KG-RAG**

The model provides a generic, non-specific answer and fails to identify the drug's approved use.

\<video src="[https://github.com/BaranziniLab/KG\_RAG/assets/42702311/dbabb812-2a8a-48b6-9785-55b983cb61a4](https://www.google.com/search?q=https://github.com/BaranziniLab/KG_RAG/assets/42702311/dbabb812-2a8a-48b6-9785-55b983cb61a4)" controls="controls" style="max-width: 730px;"\>
\</video\>

### **WITH KG-RAG**

By retrieving context from the knowledge graph, the model correctly identifies the drug's specific FDA approval and mechanism.

\<video src="[https://github.com/BaranziniLab/KG\_RAG/assets/42702311/acd08954-a496-4a61-a3b1-8fc4e647b2aa](https://www.google.com/search?q=https://github.com/BaranziniLab/KG_RAG/assets/42702311/acd08954-a496-4a61-a3b1-8fc4e647b2aa)" controls="controls" style="max-width: 730px;"\>
\</video\>

-----

## Citation

If you use this work, please cite the original paper:

```
@article{soman2023biomedical,
  title={Biomedical knowledge graph-enhanced prompt generation for large language models},
  author={Soman, Karthik and Rose, Peter W and Morris, John H and Akbas, Rabia E and Smith, Brett and Peetoom, Braian and Villouta-Reyes, Catalina and Cerono, Gabriel and Shi, Yongmei and Rizk-Jackson, Angela and others},
  journal={arXiv preprint arXiv:2311.17330},
  year={2023}
}
```