export JAVA_HOME=/etc/alternatives/jre

export NIFI_HOME=$(cd "${SCRIPT_DIR}" && cd .. && pwd)

export NIFI_PID_DIR="${NIFI_HOME}/run"
export NIFI_LOG_DIR="${NIFI_HOME}/logs"
