# Stroke Lesion Segmentation Tool

**StrokeSegApp** is an advanced application for the automated segmentation and detection of stroke lesions in brain MRI images.  
It provides both a Graphical User Interface (GUI) and a Command Line Interface (CLI) to support flexible workflows.

---

## Features

- **Dual Interface**
  - **Graphical User Interface (GUI):** User-friendly desktop application for easy interaction
  - **Command Line Interface (CLI):** Scriptable and automatable for batch processing on high-performance computing (HPC) resources

- **Automated Model Inference**
  - Quickly process brain MRI scans using state-of-the-art segmentation models trained on ATLAS v2.0 and in-house datasets

- **Model Management**
  - Import, select, and update segmentation models trained with your own nnU-Net experiments

- **Result Review & Export**
  - Visualize segmentation results
  - Export masks, preprocessing intermediates, and probability maps

---

## Quick Start

### Windows 10+

1. **Installation**  
   Download and run the StrokeSegApp installer from the [Releases page](https://github.com/Empenn-Stroke/StrokeSegApp/releases).

2. **Launch the Application**  
   - GUI: Double-click the application
   - CLI: Use `Strokeseg.exe -h` to view available commands

---

## Requirements

- **Operating System:** Windows 10+
- **Hardware:** Recommended 16 GB RAM and a modern CPU. GPU acceleration (NVIDIA CUDA) is strongly recommended for large datasets.
- **Dependencies:**  
  - [Optional] CUDA drivers installed on your system to enable GPU acceleration

---

## Documentation

- Visit the [project website](https://strokeseg-doc.readthedocs.io/en/latest/) for user and developer guides.

---

## Citation

If you use StrokeSegApp in your research, please cite:

```
@unpublished{dimatteo:hal-04647365,
  TITLE = {{Deep Learning and Multi-Modal MRI for the Segmentation of Sub-Acute and Chronic Stroke Lesions}},
  AUTHOR = {Di Matteo, Alessandro and Mah{\'e}, Youwan and Leplaideur, St{\'e}phanie s and Bonan, Isabelle and Bannier, Elise and Galassi, Francesca},
  URL = {https://inria.hal.science/hal-04647365},
  NOTE = {working paper or preprint},
  YEAR = {2025},
  KEYWORDS = {Post-stroke ; MRI ; lesion segmentation ; deep learning},
  PDF = {https://inria.hal.science/hal-04647365v2/file/Inria_ARTICLE___HAL_ARTICLE.pdf},
  HAL_ID = {hal-04647365},
  HAL_VERSION = {v2},
}
```

---

## License

This project is licensed under the GNU Affero GPL v3.  
See [LICENSE](LICENSE.txt) for details.

---

## Contact & Support

- For questions or bug reports, please open an [issue](https://github.com/Empenn-Stroke/StrokeSegApp/issues).
