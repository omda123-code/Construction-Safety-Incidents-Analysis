# Construction-Safety-Incidents-Analysis

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/mohamed-emad-396981344)  

---

## Project Overview
This project analyzes **construction safety incidents**, focusing on **human and environmental factors, project types, construction end-use, seasonal and lighting conditions, and incident costs**. The main goal is to provide actionable insights for **improving safety, reducing risks, and optimizing resource allocation**.

---

## Data & Sources
The dataset contains detailed records of safety incidents with the following key fields:  

- **Event Information:** eventType, normalStory, normalCost  
- **Temporal & Environmental:** Season (Autumn, Spring, Summer, Winter), Light (Day/Night)  
- **Project & Construction:** Project Type, Construction End Use  
- **Human & Environmental Factors:** Multiple binary columns capturing specific causes  

**Data Preparation:**  
- SQL Server queries to summarize and aggregate incidents by multiple dimensions  
- Python (Pandas, Seaborn, Matplotlib) for cleaning, aggregation, and visualization  

---

## Key Insights from Python & SQL

- **Incident Count by Event Type**  
  ![Incident Count by Event Type](charts/incident_count_event_type.png)  
  Event Type 1 most frequent (~410 incidents)

- **Average Cost by Event Type**  
  ![Average Cost by Event Type](charts/avg_cost_event_type.png)  
  Event Type 2 has the highest average cost (~$0.12)

- **Human vs Environmental Factors**  
  ![Human vs Environmental Factors](charts/human_vs_env_factors.png)  
  Environmental factors (~480) outweigh human factors (~245)

- **Incidents by Project Type**  
  ![Incident by Project Type](charts/incident_by_project_type.png)  
  New Projects/Additions have the highest incidents (~320)

- **Incidents by Construction End Use**  
  ![Incident by Construction End Use](charts/incident_by_construction_end_use.png)  
  Multi-family & Other buildings most affected (~150 incidents each)

- **Season & Light Interaction (Heatmap)**  
  ![Season Light Interaction](charts/season_light_interaction.png)  
  Highlights how season and lighting affect incident distribution

- **High-Risk Scenarios**  
  ![High-Risk Scenarios](charts/high_risk_scenarios.png)  
  WinterDayNewProjectOther shows the highest human factor risk (~42–44)

- **Human & Environmental Factors Heatmaps**  
  ![Human Factors Heatmap](charts/heatmap_human_factors.png)  
  ![Environmental Factors Heatmap](charts/heatmap_environmental_factors.png)  
  Visual comparison of contribution by project type, season, and light

- **Incident Count by Story Category**  
  ![Story Category](charts/story_category.png)  
  Low severity dominates (~580), medium (~33), high (~18)

---

## Dashboard Overview (Power BI)
**1️⃣ Overview Dashboard**  
- Total Incidents: 628 | Environmental Factors: 469 | Human Factors: 245 | Avg Cost: $0.107  
- Charts: Event Type Trends, Incidents by Season, Human vs Environmental Factors  
- Filters: Event Type, Project Type, Season, Light  

**2️⃣ Project & Construction Analysis**  
- Project Type vs Total Incidents, Incidents by Construction End Use, Avg Cost by Project Type  
- Highlight: Most Risky Project Types  

**3️⃣ Seasonal & Lighting Impact**  
- Average Cost by Season, Season vs Lighting, Incident Count by Season  

**4️⃣ Task Assignment & Risk**  
- Regular vs Non-Regular Task Assignments, Task Assignment vs Cost & Human Factors  

**5️⃣ Cost & Severity Analysis**  
- Highest Cost Event, Normalized Cost Distribution, Total Cost per Project Type  

**6️⃣ High-Risk Scenarios & Heatmaps**  
- Environmental & Human Factors by Season x Light x Project Type  

> Each page includes cards, slicers, and charts to allow **interactive filtering and detailed analysis**.

---

## Project Structure
```
/ConstructionSafetyAnalysis
│
├─ /SQL_Queries
│ └─ Aggregation & Analysis Queries.sql
│
├─ /Python_Analysis
│ └─ Visualization.ipynb
|
├─ /charts 
│
├─ /PowerBI_Dashboard
│ └─ SafetyIncidents.pbix
│
└─ README.md
```

---

## Key Findings
- Human and environmental factors contribute differently across **project types, seasons, and lighting conditions**  
- New Projects/Additions and certain seasons (Winter, Summer) have **higher incident risk**  
- Task assignments affect **human factor incidence**, highlighting the importance of proper allocation  
- Costs vary significantly by event type and project type, indicating areas for **financial and operational focus**  

---

## Recommendations
- **Prioritize preventive measures** in high-risk project types and seasons  
- **Improve task assignment protocols** to reduce human factor incidents  
- **Allocate safety resources** based on environmental and human factor trends  
- **Regularly monitor dashboards** for near real-time insights  

---

## Author
**Mohamed Emad | Data Analyst** 

***Mechanical Engineering Background***
