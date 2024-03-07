# Adventure Works

## 🚀 Indicium Certification

The purpose of this certification is to assess your skills in a practical project according to the Modern Analytics Stack methodology, developed by Indicium but which has many similarities with the Modern Data Stack used by thousands of modern data teams. Obtaining this certification indicates that you:

- Understand the process of building a modern analytics platform;
- Understand the objectives of dimensional modeling in modern data warehouses;
- Know how to apply SQL language and the dbt tool to model data in modern data warehouses;
- Know the best practices of data visualization and its application in a Self-Service BI tool.
- Are capable of developing, validating, and testing the most appropriate statistical models and approaches for the business problem.

## Context

The following company has hired you: Adventure Works (AW), a rapidly growing bicycle industry that prides itself on having over 500 distinct products, 20,000 customers, and 31,000 orders. To maintain its growth pace and differentiate itself from the competition, Adventure Works wants to use its data strategically, guiding its decisions to become a data-driven company. The Adventure Works board has already listed a series of questions that it wants to answer through data cross-referencing, which should guide the development of the fact and dimension tables of the data warehouse. To start the project and get quick results, the option was to start with the sales area, but some tables from other areas may be necessary to get the desired information. In your initial diagnosis, you identified some systems that Adventure Works uses and that generate relevant data for the business and that, at some point, should be part of the data infrastructure:

In the initial conversations, you also identified that the project is not unanimous within the company and that there are doubts about the schedule, costs involved, and whether there will be a return on the investment made.

The project was conceived and sponsored by AW's innovation director, João Muller, and also has the support of the company's CEO, Carlos Silveira, who sees data usage as a long-term strategic differential. However, in the view of the commercial director, Silvana Teixeira, the value invested in the project could have been directed to promotional actions that generate, in her opinion, immediate sales results. In addition, she still cannot see how the creation of a modern data infrastructure will assist in her commercial department, since promises to make the area data-driven, made by suppliers of other systems (such as CRM and Web Analytics), have not been able to achieve the promised results.

The IT director, Nilson Ramos, is responsible for ensuring data access and has indicated an analyst, Gabriel Santos, to assist him in this access. Gabriel is currently responsible for managing databases and answering specific questions from business areas that require the use of SQL. He has a very limited schedule, so coordinating communication and agility in interactions are essential to ensure that all necessary data is available for the project.

In addition to these people, João Muller has secured a possible sponsor for new projects within one of the business areas. This is Luís Soares, manager of the Demand Planning team of the organization. Currently, production planning is done based on 3-month moving averages using only Excel. Luís would like to receive an analysis demonstrating the potential of a predictive solution to hire a complete implementation project. The area has a budget to invest in innovation, but for the project to be successful it is essential to demonstrate the value of the solution compared to the current process.

## Data description

Adventure Works has a transactional database (PostgreSQL) that stores data from its different areas. This data is distributed across 68 tables divided into 5 schemas: HR (human resources), Sales, Production, and Purchasing.

## Deliveries

Adventure Works trusts your technical ability to design and implement its modern analytics infrastructure from start to finish, which should contain the following items.

1. Conceptual diagram of the data warehouse in pdf format: create with the facts and dimensions tables necessary to answer the business questions presented below. Present, in addition to the fact and dimension tables, an aggregated sales table by region and seller. In summary, show what are the source tables necessary to create the facts and dimensions tables (suggestion: draw.io).

2. Configuration of a data warehouse: do it in the cloud or use one that you already have configured (suggestion: Google Big Query).

3. [Optional] E-L (extract-load) pipeline: create to populate the DW with the data from the Adventure Works database (suggestion: Stitch Data or Kondado). Otherwise, for simplicity use the ready dbt repository with Adventure Works data.

4. Data transformation: transform raw data using dbt (suggestion: dbt Cloud). This transformation must include documentation and schema tests and at least one data test, and be versioned in a code repository (example: git/bitbucket). You must provide the repository link on Github.

5. Data presentation: The Adventure Works project will facilitate the day-to-day operation and management of the company.

   5.1 From the data presented, prepare a report page, in a BI tool, that brings the main indicators to be seen daily by the CEO, Carlos Silveira. Remember to use aggregated information, which generates quick insights for the company's management.

   5.2 In addition to the report, you have been assigned to prepare a dashboard, this time for AW's operation. At the operational level, the dashboard needs to deliver value with greater granularity. For this dashboard, the team expects to be able to analyze sales in some cuts:

   - By order, to understand periodicity, average ticket, quantity, distribution by payment method, reason for purchase, and other applicable dimensions.

   - By region, to understand which locations Adventure Works has a larger market share.

   - By customers, to use email marketing actions with customers who buy the most and bring closer those who have not been buying for a while.

As a data professional, you must exercise thinking in relation to the metrics that are essential for decision making at AW, both at the managerial and operational level. The delivery of the report and the dashboard can be in the same file or in separate files, remember to describe which is which.

6. Data project planning: you must pass on to other analysts all the steps that were necessary for the Adventure Works data project. Present, in video or detailed report format, what information you think is important. In particular, take into account the expected objectives, stakeholders, and risks/contingencies of the project. In addition, in what other ways can we generate value in data infrastructure projects?

Note: if you choose to send in video, be aware that it should not last longer than 10 minutes.

7. In order to adjust the distribution of products and have a better estimate of the need to purchase raw materials, make a forecast of the demand for the next 3 months for each product in each store. Also, point out whether or not there is seasonality in any product of your choice.

8. Would it be possible to solve this problem through an approach using regression models? If so, which one shows the best result? Justify using evaluation metrics.

9. The new distribution centers have been divided into provinces in the USA and countries in the rest of the world. Which of these groups showed the most growth in demand in the three months predicted in item 7?

10. A new glove supplier, which now encompasses all world production, needs to have an estimate.

## Delivery Method

All steps of the project must be archived in a WinRAR file or Zip folder and sent through Moodle as follows:

- Github: you must deliver the entire project on GitHub through a link in a text file in the folder.

- Youtube/Drive/Dropbox: you must insert the video on one of these platforms through a link in a text file in the folder.

- Conceptual Model: you must insert the Final Project Conceptual Model in the WinRAR or Zip folder.

- Dashboard: if a tool that does not offer a link is used, as is the case with Power BI, attach the .pbix file to the folder.

- Report: you must insert the report in pdf format in a file within the folder.

- Development notebook for the demand forecasting part.

## How to run this project

Clone the repository using the link:

```bash
$ git clone https://github.com
```

Then, it is recommended to create a virtual environment on your machine, using the following code:

```bash
$ python3 -m venv venv ----> or
$ py -3.8 -m venv name_of_venv ---> Bash on windows
```

It is recommended to use Python version 3.8, as it was found that later versions had some incompatibilities with dbt.

After activating your virtual environment, install the project requirements with the command:

```bash
$ pip install -r requirements.txt ----> or
$ python -m pip install -r requirements.txt ---> for some cases where the previous command does not work.
```

And finally, configure your credentials in the profile.yml file that will be on your machine.

Before running the project, you can check the status of your credentials with the command:

```bash
$ dbt debug
```

If it returns the message "All checks passed!", you can run the project with the command:

```bash
$ dbt run
```

If you make any changes to the project, it is recommended to run the tests again to ensure the integrity of the model. The command to perform this task is:

```bash
$ dbt test
```

## Built with:

- [DBT] - Data Transformation Tool
- [GoogleBigQuery] - Cloud Data Warehouse
- [PowerBI] - BI Tool.
- [Draw.IO] - Drawing and Diagram Creation Tool.

## Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Author

Natacha S. S. da Silva - Analytics Engineering