# 🚀 Project 1: Semantic Assistant(Talk to my Warehouse) Sprint (Git + Analytics Engineering)

## Week 1: Foundation & Git Core
- [ ] **Day 1: Setup & Ingestion**
    - [ ] `git init` & create `.gitignore` (exclude .env, target/, profiles.yml).
    - [ ] Load raw dataset into Snowflake.
    - [ ] Initial Commit: `git add .` && `git commit -m "chore: initial repo setup"`
- [ ] **Day 2: dbt Initialization**
    - [ ] `git checkout -b feature/dbt-setup`
    - [ ] Run `dbt init` and configure profiles.
- [ ] **Day 3: Staging Models**
    - [ ] Build `stg_` models for cleaning/renaming.
    - [ ] Atomic Commit: `git commit -m "feat: add staging models for e-commerce data"`
- [ ] **Day 4: Conflict Simulation**
    - [ ] Intentionally cause and resolve a merge conflict in `dbt_project.yml`.
- [ ] **Day 5: Core Modeling**
    - [ ] `git stash` work-in-progress; fix a dummy bug, then `git stash pop`.
    - [ ] Build `fct_sales` and `dim_customers` (Star Schema).
- [ ] **Day 6: Docs & Testing**
    - [ ] Write descriptions/tests in `schema.yml`.
    - [ ] `git tag -a v0.1 -m "Semantic Foundation Complete"`
- [ ] **Day 7: The Pull Request (PR)**
    - [ ] Push branch to
  ; open and merge your first PR into `main`.

## Week 2: AI Integration & DataOps
- [ ] **Day 8: AI Environment**
    - [ ] `git checkout -b feature/ai-integration`
    - [ ] Setup Python `requirements.txt` (LangChain, OpenAI).
- [ ] **Day 9: Metadata Extraction**
    - [ ] Write Python script to parse dbt `manifest.json`.
    - [ ] Commit script: `git commit -m "feat: add dbt metadata parser"`
- [ ] **Day 10: Vector Store**
    - [ ] Embed metadata into ChromaDB or Pinecone.
- [ ] **Day 11: RAG Chain**
    - [ ] Build the Text-to-SQL retrieval chain using LangChain.
- [ ] **Day 12: Streamlit UI**
    - [ ] Build the chat interface for "Talking to the Warehouse."
- [ ] **Day 13: CI/CD Automation**
    - [ ] Setup `.github/workflows/dbt_test.yml` to run tests on push.
- [ ] **Day 14: Final Release**
    - [ ] `git tag -a v1.0 -m "Project 1 Launch"`
    - [ ] Finalize README with an architecture diagram.
