## IMPORTANT: this file and accompanying assets are the source for snippets in https://docs.microsoft.com/azure/machine-learning! 
## Please reach out to the Azure ML docs & samples team before before editing for the first time.

# <hello_world>
job_id=`az ml job create -f hello-world.yml --query name -o tsv`
# </hello_world>

# <show_job_in_studio>
az ml job show -n $job_id --web
# </show_job_in_studio>

# <stream_job_logs_to_console>
az ml job stream -n $job_id
# </stream_job_logs_to_console>

# <check_job_status>
status=`az ml job show -n $job_id --query status -o tsv`
echo $status
if [[ $status -eq "Completed" ]]
then
  echo "Job completed"
elif [[ $status -eq "Failed" ]]
then
  echo "Job failed"
  exit 1
else 
  echo "Job status not failed or completed"
  exit 2
fi
# </check_job_status>