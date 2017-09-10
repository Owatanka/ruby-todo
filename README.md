# Ruby Garage Test Task
Given tables:
★ tasks (id, name, status, list_id)
★ lists (id, name)

Write the queries for:
1. get all statuses, not repeating, alphabetically ordered

   ``SELECT DISTINCT status FROM tasks ORDER BY status;``
  
2. get the count of all tasks in each project, order by tasks count descending

   ``SELECT COUNT(*) AS amount FROM tasks GROUP BY list_id ORDER BY amount DESC;``
      
3. get the count of all tasks in each project, order by projects names

   ``SELECT COUNT(*) AS amount, lists.name FROM tasks INNER JOIN lists ON list_id = lists.id 
   GROUP BY lists.name ORDER BY lists.name ASC;``
      
4. get the tasks for all projects having the name beginning with “N” letter

   ``SELECT * FROM tasks WHERE name like 'N%';``
      
5. get the list of all projects containing the ‘a’ letter in the middle of the name, and
show the tasks count near each project. Mention that there can exist projects without
tasks and tasks with project_id=NULL

   ``SELECT lists.name, (select count(*) FROM tasks WHERE tasks.list_id=lists.id) 
   FROM lists WHERE lists.name like '_%a%_'``
      
6. get the list of tasks with duplicate names. Order alphabetically

   ``SELECT id, name, status, list_id FROM tasks WHERE name in (select name from tasks 
   GROUP BY name having (COUNT(name)>1)) ORDER BY name``
      
7. get the list of tasks having several exact matches of both name and status, from
the project ‘Garage’. Order by matches count    

   ``SELECT count (*) as matches_count,tasks.name,tasks.status 
   FROM tasks, lists where lists.name='Garage' and list_id = lists.id 
   GROUP BY tasks.name,tasks.status having (count(*) >1) ORDER BY matches_count``
   
8. get the list of project names having more than 10 tasks in status 'completed'. Order by project_id

   ``SELECT name FROM lists WHERE id in (select list_id 
   FROM tasks, lists WHERE status='completed' and list_id = lists.id 
   GROUP BY list_id having (count(*) >10)) ORDER BY id``
   
   
   
   

   
