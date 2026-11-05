# **DegreeROI**

DegreeROI is an interactive decision-support platform designed to answer a critical question facing prospective and current college students: Is your degree worth the price?

### **Purpose & Problem Statement**

Higher education is one of the largest financial investments individuals make, yet students and families routinely choose colleges and majors without clear visibility into:

- The true net cost of attendance versus expected career earnings.

- Post-graduation debt loads and realistic payback horizons.

- How return on investment (ROI) varies drastically across fields of study, institution tiers, and geographic regions.

DegreeROI eliminates this gap by aggregating college cost and earnings datasets into a unified analytical tool. It empowers students, academic advisors, and university leadership to evaluate educational pathways using transparent financial metrics rather than guesswork.

### **Key Features**

- **Side-by-Side ROI Comparisons:** Benchmark expected 10-year earnings, net costs, and cumulative ROI across majors, degree categories, and institution tiers.

- **Dynamic Scenario Engine:** Interactive sliders allow users to simulate personalized financial scenarios—adjusting financial aid packages, anticipated student loan debt, and career time horizons.

- **Payback & Breakeven Modeling:** Calculates the exact timeline required to offset educational costs against baseline career earnings.

- **Geographic & Institutional Insights:** Filter programs by state and region to examine in-state value vs. out-of-state penalties.

### **Architecture & Tech Stack**

DegreeROI is built as an end-to-end containerized data pipeline and web application:

- **Orchestration:** Docker Compose coordinates the isolated database, backend, and frontend services.

- **Database:** PostgreSQL storing a normalized relational schema (Graduate, Academics, Money, ROI Targets).

- **ETL Pipeline:** Python-based data cleaning and validation leveraging Kaggle College ROI records compiled from FREOPP, NCES IPEDS, and the U.S. Bureau of Economic Analysis (BEA).

- **Compute / API Layer:** FastAPI handling analytical queries, multi-variable filtering, and ROI algorithms.

- **Frontend / Dashboard:** Streamlit providing an interactive user interface with intuitive controls, dynamic plots, and data tables.

### **Team ARK**

Developed for IEM 4723 (Information Systems Design):

- Andrew Gungoll

- Ryan Leslie

- Killian Barnes
