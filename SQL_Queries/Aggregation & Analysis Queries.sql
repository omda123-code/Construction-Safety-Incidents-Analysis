use [Construction Safety Accidents]
select * from SafetyIncidents

-- Question: How many incidents occurred for each event type?
-- Purpose: Identify the most frequent type of safety incident.
SELECT eventType, COUNT(*) AS IncidentCount
FROM SafetyIncidents
GROUP BY eventType;


-- Question: What is the average cost associated with each type of incident?
-- Purpose: Evaluate the financial impact of different incident types.
SELECT eventType, AVG(normalCost) AS AvgCost
FROM SafetyIncidents
GROUP BY eventType;


-- Question: How many incidents occur in each season?
-- Purpose: Detect seasonal patterns that may affect safety risks.
SELECT 
    SUM(Season_Spring) AS SpringIncidents,
    SUM(Season_Summer) AS SummerIncidents,
    SUM(Season_Autumn) AS AutumnIncidents,
    SUM(Season_Winter) AS WinterIncidents
FROM SafetyIncidents;


-- Question: Are incidents more common during day or night?
-- Purpose: Evaluate lighting-related risks.
SELECT 
    SUM(Light_Day) AS DayIncidents,
    SUM(Light_Night) AS NightIncidents
FROM SafetyIncidents;


-- Question: Which type of construction end-use has the highest incident rate?
-- Purpose: Understand which construction projects are more prone to incidents.
SELECT 
    SUM(Construction_End_Use_Commercial_building) AS Commercial,
    SUM(Construction_End_Use_Multi_family_dwelling) AS MultiFamily,
    SUM(Construction_End_Use_Other_building) AS Other,
    SUM(Construction_End_Use_Single_family_or_duplex_dwelling) AS SingleFamily
FROM SafetyIncidents;


-- Question: Which type of project sees the most incidents?
-- Purpose: Assess risk by project type (new, alteration, maintenance, etc.)
SELECT 
    SUM(Project_Type_New_project_or_new_addition) AS NewProjects,
    SUM(Project_Type_Alteration_or_rehabilitation) AS Alterations,
    SUM(Project_Type_Maintenance_or_repair) AS Maintenance,
    SUM(Project_Type_Demolition) AS Demolition,
    SUM(Project_Type_Other) AS OtherProjects
FROM SafetyIncidents;


-- Question: Which incidents have the highest cost impact?
-- Purpose: Prioritize high-cost incidents for safety measures.
SELECT TOP 10 *
FROM SafetyIncidents
ORDER BY normalCost DESC;


-- Question: How does the cost of incidents vary by season?
-- Purpose: Detect seasonal financial risks.
SELECT
    AVG(CASE WHEN Season_Spring = 1 THEN normalCost END) AS SpringCost,
    AVG(CASE WHEN Season_Summer = 1 THEN normalCost END) AS SummerCost,
    AVG(CASE WHEN Season_Autumn = 1 THEN normalCost END) AS AutumnCost,
    AVG(CASE WHEN Season_Winter = 1 THEN normalCost END) AS WinterCost
FROM SafetyIncidents;


-- Question: Do incidents at night cost more than during the day?
-- Purpose: Evaluate risk impact under different lighting conditions.
SELECT
    AVG(CASE WHEN Light_Day = 1 THEN normalCost END) AS AvgCostDay,
    AVG(CASE WHEN Light_Night = 1 THEN normalCost END) AS AvgCostNight
FROM SafetyIncidents;


-- Question: Which environmental factors are most associated with incidents?
-- Purpose: Identify environmental hazards to reduce risk.
SELECT
    SUM(Environmental_Factor_Other) AS Other,
    SUM(Environmental_Factor_Work_Surface_Facility_Layout_Condition) AS WorkSurfaceIssues
FROM SafetyIncidents;


-- Question: Are regularly assigned tasks safer than non-regular tasks?
-- Purpose: Assess risk based on task assignment patterns.
SELECT 
    SUM(Task_Assigned_Regularly_Assigned) AS RegularTaskIncidents,
    SUM(Task_Assigned_Not_Regularly_Assigned) AS NonRegularTaskIncidents
FROM SafetyIncidents;


-- Question: How many incidents have more than one contributing factor?
-- Purpose: Identify complex incidents that require deeper investigation.
SELECT COUNT(*)
FROM SafetyIncidents
WHERE 
    (Human_Factor_Position_Inappropriate_For_Task + Human_Factor_Other +
     Environmental_Factor_Other + En) > 1;


-- Question: What is the distribution of normalStory values in incidents?
-- Purpose: Analyze incident severity relative to story level.
SELECT 
    CASE
        WHEN normalStory < 0.1 THEN 'Very Low'
        WHEN normalStory BETWEEN 0.1 AND 0.5 THEN 'Low'
        WHEN normalStory BETWEEN 0.5 AND 1 THEN 'Medium'
        ELSE 'High'
    END AS StoryCategory,
    COUNT(*) AS IncidentCount
FROM SafetyIncidents
GROUP BY 
    CASE
        WHEN normalStory < 0.1 THEN 'Very Low'
        WHEN normalStory BETWEEN 0.1 AND 0.5 THEN 'Low'
        WHEN normalStory BETWEEN 0.5 AND 1 THEN 'Medium'
        ELSE 'High'
    END;


-- Question: Which project types are more incident-prone in summer?
-- Purpose: Identify seasonal risk trends by project type.
SELECT 
    SUM(CASE WHEN Season_Summer = 1 AND Project_Type_Alteration_or_rehabilitation = 1 THEN 1 ELSE 0 END) AS SummerAlteration,
    SUM(CASE WHEN Season_Summer = 1 AND Project_Type_New_project_or_new_addition = 1 THEN 1 ELSE 0 END) AS SummerNewProjects
FROM SafetyIncidents;


-- Question: Are human factors or environmental factors more common in incidents?
-- Purpose: Determine which type of factor to prioritize for safety improvements.
SELECT
    SUM(Human_Factor_Position_Inappropriate_For_Task + Human_Factor_Other) AS HumanFactors,
    SUM(Environmental_Factor_Other + Environmental_Factor_Work_Surface_Facility_Layout_Condition) AS EnvironmentalFactors
FROM SafetyIncidents;

-- Question: How do season and lighting conditions together influence incident count?
-- Purpose: Identify high-risk periods based on time of year and lighting.
SELECT 
    SUM(CASE WHEN Season_Spring=1 AND Light_Day=1 THEN 1 ELSE 0 END) AS SpringDay,
    SUM(CASE WHEN Season_Spring=1 AND Light_Night=1 THEN 1 ELSE 0 END) AS SpringNight,
    SUM(CASE WHEN Season_Summer=1 AND Light_Day=1 THEN 1 ELSE 0 END) AS SummerDay,
    SUM(CASE WHEN Season_Summer=1 AND Light_Night=1 THEN 1 ELSE 0 END) AS SummerNight,
    SUM(CASE WHEN Season_Autumn=1 AND Light_Day=1 THEN 1 ELSE 0 END) AS AutumnDay,
    SUM(CASE WHEN Season_Autumn=1 AND Light_Night=1 THEN 1 ELSE 0 END) AS AutumnNight,
    SUM(CASE WHEN Season_Winter=1 AND Light_Day=1 THEN 1 ELSE 0 END) AS WinterDay,
    SUM(CASE WHEN Season_Winter=1 AND Light_Night=1 THEN 1 ELSE 0 END) AS WinterNight
FROM SafetyIncidents;

-- Question: What is the average incident cost by season and project type?
-- Purpose: Identify which project types are costlier in specific seasons.
SELECT 
    AVG(CASE WHEN Season_Summer=1 AND Project_Type_Alteration_or_rehabilitation=1 THEN normalCost END) AS SummerAlterationCost,
    AVG(CASE WHEN Season_Summer=1 AND Project_Type_New_project_or_new_addition=1 THEN normalCost END) AS SummerNewProjectCost,
    AVG(CASE WHEN Season_Winter=1 AND Project_Type_Alteration_or_rehabilitation=1 THEN normalCost END) AS WinterAlterationCost,
    AVG(CASE WHEN Season_Winter=1 AND Project_Type_New_project_or_new_addition=1 THEN normalCost END) AS WinterNewProjectCost
FROM SafetyIncidents;

-- Question: How do human factors vary across seasons?
-- Purpose: Detect seasonal patterns in human errors or unsafe behavior.
SELECT 
    SUM(CASE WHEN Season_Summer=1 AND Human_Factor_Position_Inappropriate_For_Task=1 THEN 1 ELSE 0 END) AS SummerPositionIssue,
    SUM(CASE WHEN Season_Winter=1 AND Human_Factor_Other=1 THEN 1 ELSE 0 END) AS WinterOtherHuman
FROM SafetyIncidents;

-- Question: Which environmental factors occur most by project type?
-- Purpose: Identify environmental risks specific to project types.
SELECT 
    SUM(CASE WHEN Project_Type_Alteration_or_rehabilitation=1 AND Environmental_Factor_Work_Surface_Facility_Layout_Condition=1 THEN 1 ELSE 0 END) AS AlterationWorkSurface,
    SUM(CASE WHEN Project_Type_New_project_or_new_addition=1 AND Environmental_Factor_Other=1 THEN 1 ELSE 0 END) AS NewProjectOtherEnv
FROM SafetyIncidents;

-- Question: Which combination of season, light, and human factor causes most incidents?
-- Purpose: Find risky scenarios combining multiple factors.
SELECT 
    SUM(CASE WHEN Season_Summer=1 AND Light_Day=1 AND Human_Factor_Position_Inappropriate_For_Task=1 THEN 1 ELSE 0 END) AS SummerDayPosition,
    SUM(CASE WHEN Season_Summer=1 AND Light_Night=1 AND Human_Factor_Position_Inappropriate_For_Task=1 THEN 1 ELSE 0 END) AS SummerNightPosition
FROM SafetyIncidents;

-- Question: Are certain project types more affected by environmental factors in specific seasons?
-- Purpose: Highlight seasonal environmental risks by project.
SELECT 
    SUM(CASE WHEN Season_Spring=1 AND Project_Type_Alteration_or_rehabilitation=1 AND Environmental_Factor_Other=1 THEN 1 ELSE 0 END) AS SpringAlterationEnv,
    SUM(CASE WHEN Season_Autumn=1 AND Project_Type_New_project_or_new_addition=1 AND Environmental_Factor_Work_Surface_Facility_Layout_Condition=1 THEN 1 ELSE 0 END) AS AutumnNewProjectEnv
FROM SafetyIncidents;

-- Question: How do human and environmental factors together impact incident cost?
-- Purpose: Identify high-cost factor combinations.
SELECT 
    AVG(CASE WHEN Human_Factor_Position_Inappropriate_For_Task=1 AND Environmental_Factor_Other=1 THEN normalCost END) AS PositionAndEnvCost,
    AVG(CASE WHEN Human_Factor_Other=1 AND Environmental_Factor_Work_Surface_Facility_Layout_Condition=1 THEN normalCost END) AS OtherHumanWorkSurfaceCost
FROM SafetyIncidents;

-- Question: How do seasons influence incident counts in different building types?
-- Purpose: Identify high-risk seasons per building type.
SELECT 
    SUM(CASE WHEN Season_Summer=1 AND Construction_End_Use_Commercial_building=1 THEN 1 ELSE 0 END) AS SummerCommercial,
    SUM(CASE WHEN Season_Summer=1 AND Construction_End_Use_Other_building=1 THEN 1 ELSE 0 END) AS SummerOther,
    SUM(CASE WHEN Season_Winter=1 AND Construction_End_Use_Commercial_building=1 THEN 1 ELSE 0 END) AS WinterCommercial,
    SUM(CASE WHEN Season_Winter=1 AND Construction_End_Use_Other_building=1 THEN 1 ELSE 0 END) AS WinterOther
FROM SafetyIncidents;

-- Question: Which type of factor contributes more to cost: Human or Environmental?
-- Purpose: Prioritize interventions for cost reduction.
SELECT 
    AVG(CASE WHEN Human_Factor_Position_Inappropriate_For_Task=1 THEN normalCost END) AS AvgHumanFactorCost,
    AVG(CASE WHEN Environmental_Factor_Other=1 THEN normalCost END) AS AvgEnvFactorCost
FROM SafetyIncidents;

-- Question: Which combination of season, light, project type, and human factor is most incident-prone?
-- Purpose: Pinpoint highest-risk scenarios for preventive measures.
SELECT 
    SUM(CASE WHEN Season_Summer=1 AND Light_Day=1 AND Project_Type_Alteration_or_rehabilitation=1 AND Human_Factor_Position_Inappropriate_For_Task=1 THEN 1 ELSE 0 END) AS SummerDayAlterationPosition,
    SUM(CASE WHEN Season_Summer=1 AND Light_Night=1 AND Project_Type_Alteration_or_rehabilitation=1 AND Human_Factor_Position_Inappropriate_For_Task=1 THEN 1 ELSE 0 END) AS SummerNightAlterationPosition,
    SUM(CASE WHEN Season_Winter=1 AND Light_Day=1 AND Project_Type_New_project_or_new_addition=1 AND Human_Factor_Other=1 THEN 1 ELSE 0 END) AS WinterDayNewProjectOther
FROM SafetyIncidents;



