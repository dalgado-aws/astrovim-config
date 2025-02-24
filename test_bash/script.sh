
function login_to_oc() {
  oc login -u $1 -p $2
}

function iterate_over_projects() {
  for project in $(oc get projects -o jsonpath='{.items[*].metadata.name}'); do
    echo "Project: $project"
  done
}

function kill_processes_running_for_10_days( ) {
  for process in $(ps -ef | grep -v grep | grep -v $0 | grep -v $1 | grep -v $2 | grep -v $3 | grep -v $4 | grep -v $5 | grep -v $6 | grep -v $7 | grep -v $8 | grep -v $9 | awk '{print $2}'); do
    echo "Killing process: $process"
    kill -9 $process
  done
}


function delete_pods_running_for_10_days() {
  for pod in $(oc get pods -o jsonpath='{.items[*].metadata.name}'); do
    echo "Pod: $pod"
    #find pod alive 17:53:00
  done
}


