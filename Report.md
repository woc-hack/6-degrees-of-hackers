#6-degrees-of-hackers

**Cleo Schulten**, *University Duisburg-Essen, Germany*, cleo.schulten@uni-due.de </br>
**Ebtesam Haque**, *George Mason University, VA, USA*, ehaque4@gmu.edu </br>
**Irene-Angelica Chounta**, *University Duisburg-Essen, Germany*, irene-angelica.chounta@uni-due.de </br>
**Mahmoud Jahanshahi**, *University of Tennessee, TN, USA*, mjahansh@vols.utk.edu </br>
**Muntaser Syed**, *Florida Institute of Technology, FL, USA*, msyed2011@my.fit.edu </br>

**Abstract:** Please provide a short summary of your project here.

**Link:** If applicable, please provide a link to your paper on [Arxiv](https://arxiv.org/) or a similar platform here.

***

### 1. Introduction
*Please add a description of your project, including your research goals or questions here.*

With hackathons attracting so many people and with "repeat offenders", i.e. people who attend one hackathon after another, we were wondering how interconnected the participants of hackathons are based on the projects they worked on.
Namely, are there highly connected participants and if so who are they? Additionally, for the largest connected subgraph, we want to look how all its participants are connected to each other and investigate the path length within the network.
6 degrees of hackers therefore aims to look into the erdös/bacon/sabbath number of hackathons. 

### 2. Methodology
*Please provide an overview of your research approach and workflow, including how you used World of Code to achieve your research goals or answer your research questions here.*

To explore this, we gathered the DevPost data and extracted the projects list. Having this list, we used p2P World of Code mappings
to get deforked projects list and from there, using P2c mappings, we retrieved all the commits in these projects.
After that, we used c2dat maps to get the author name and the timestamps associated with each commit.
Having the start and end time of each hackathon project from DevPost dataset, we filtered out those commits that
were not in the hackathon time period. Doing this, we found the list of all relevant commits and responsible authors for the hackathon projects.
We used this data to build WOC Authorship graph, i.e. the graph of commit authors on hackathon github repositories during the time of the hackathon with the edges signifying shared projects.  

Additionally, we created a graph from the hackathon project participants according to devpost equally connected via shared projects.

### 3. Preliminary Findings
*Please describe your preliminary findings here.*

We gathered about 86000 projects on the first pass filtering, after filtering for projects with at least a single commit we were left with about 68000 projects.  
Using WoC, we found about 100 million unique commits in these projects. Yet, pairing these commits with projects indexed based on the DevPost datset, we ended up with 340 million commit-project pairs, meaning that many hackathon projects share same commits. 
Nevertheless, after filtering out the commits that were not done in the hackathon project time period, we ended up with about 4.6 million commit-project pairs consisting of 2.7 million unique commits. Based on these findings, less than 3% of the commits in these projects were made during the hackathon. 
Based on WoC authorIDs, these commits were done by 190 thousand authors that using a2A maps was reduced to 160 thousand unique authors.

### 4. Challenges
*Please describe difficulties you encountered during the project related to World of Code. If possible, please also make suggestions on how you think they could be solved.*

We ran into some difficulties when creating the graphs relating to size of the network, working memory and processing time.
Working specifically with authors highlighted and amplified the issue of author aliasing between devpost, github handle and WoC. 

### 5. Future Work
*Please add a description of your planned future work here. This can include a target outlet.*



### References
*Please add a list of the references you used during the text here. If you did not use any references, you can omit this section.*

