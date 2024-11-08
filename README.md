# Futbol

## Check-in Plan 
- Our team has established the following check-in structure to maintain consistent communication and collaboration throughout the project:
	•	Daily Check-Ins: During designated work blocks (3-4 hours) in class, team members will discuss progress, address blockers, and assign tasks for the day.
	•	Slack Updates: Team members will post updates in the Slack channel if they are unable to attend a daily check-in or complete assigned tasks outside of work blocks.
	•	Ad-Hoc Huddles: For urgent issues, we will organize short huddles to address them promptly and keep the project on track.(Based on everyones availability)


## Project Organization and Workflow
- GitHub Repository: All code is pushed to a shared GitHub repository with protected branches to ensure code quality and avoid accidental changes to main.
- Branching Strategy: We adopted a feature-branch workflow. Each team member creates a branch for their assigned methods and submits pull requests for peer review.
- Code Reviews: Pull requests must be reviewed and approved by at least one other team member before merging into the main branch.
- Task Assignments: Tasks are divided by features or methods. Each member is responsible for implementing, testing, and documenting their assigned tasks. This is maintained by project tracker in slack.(https://turingschool.slack.com/lists/T029P2S9M/F07UWA2U2J0?view_id=View07V6F99XL1)


## Project Organization Approaches
- Initial Approaches: We explored several options for collaboration, including working on the same branch collaboratively and dividing tasks by features or files.
- Final Decision: After team discussion, we agreed on a feature-branch workflow to enable parallel development and reduce merge conflicts.
- We collectively decided on the following collaboration approaches: 
  - Mob Programming
  - Synchronous Work Sessions
  - Independent Task Ownership
  - Asynchronous Collaboration
  - Voting System
  - Feature-Based Assignment
  - Collaborative Debugging


## Code Design
- Our code adheres to the Single Responsibility Principle (SRP) and DRY designed to be dynamic and adaptable. 
- Key design choices include:
  • StatTracker: Serves as the main interface for interacting with the project data.
	•	StatCalculator: Contains methods to calculate project-specific statistics.
- Data Classes:
	•	Games: Responsible for loading and organizing game data.
	•	Teams: Responsible for handling team-related data.
	•	GameTeams: Manages data that links games and teams.
- Test Driven Development:
  • Fixtures: Serves as predefined data sets 
  • Isolation Testing: stubs and mocks

Include link to your initial DTR document and the date it was completed. If you do additional DTRs later in the project, you should link the revised versions here as well with the date. New versions should be listed alongside older versions. Do not delete old DTRs.
DTR Document
Initial DTR
	•	Date: November 4, 2024
	•	Link: [Initial DTR Document](https://docs.google.com/document/d/e/2PACX-1vQp5qjABh1RMFwup5VM6o5N6oWucY9cuxxBww0Rr872fZNl_V9oUMqusqXMMzJQeacJDmoItGh7_D3-/pub)
Updated DTRs
	•	Date: [Revised Date 1]
	•	Link: Revised DTR Document 1

## Retro 
  •
  •
  •


## Contributors
| Name         | LinkedIn                      | GitHub                     |
|--------------|-------------------------------|----------------------------|
| Kevin Newland    | [LinkedIn Profile](https://www.linkedin.com/in/kevin-newland-95b719179/)         | [GitHub Profile](https://github.com/kevin-newland)        |
| Kristin Weiland   | [LinkedIn Profile](https://www.linkedin.com/in/kristin-weiland-7787159/)         | [GitHub Profile](https://github.com/KMPWeiland)        |
| Qory Dozier   | [LinkedIn Profile](http://www.linkedin.com/in/sequoyahdozier)         | [GitHub Profile](https://github.com/qoryhanisagal)        |
| Dustin Peukert   | N/A         | [GitHub Profile](https://github.com/DustinPeukert)        |
Starter repository for the [Turing School](https://turing.edu/) Futbol project.
