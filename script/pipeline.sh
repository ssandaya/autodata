pipeline {
    agent any
    stages {
        stage('config_file') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_config_file.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the config_file"
                    exit $?
                fi
                '''
            }
        }
        stage('load_current_version') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_load_current_version.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load version"
                    exit $?
                fi
                '''
            }
        }
        stage('load_current_version_check') {
            steps {
                sh '''
                sleep 300
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_load_current_version_check.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load version check"
                    exit $?
                fi
                '''
            }
        }
        stage('clear_logs') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_clear_logs.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the clear logs reset database"
                    exit $?
                fi
                '''
            }
        }
        stage('inventory_before_upgrade') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_inventory_before_upgrade.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the inventory_before_upgrade"
                    exit $?
                fi
                '''
            }
        }
        stage('delivery_before_upgrade') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_delivery_before_upgrade.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the delivery_before_upgrade"
                    exit $?
                fi
                '''
            }
        }
        stage('leak_test_history') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_leak_test_history.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the leak_test_history"
                    exit $?
                fi
                '''
            }
        }
        stage('leak_combined_alarm_history') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_combined_alarm_history.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the combined_alarm_history"
                    exit $?
                fi
                '''
            }
        }
        stage('pressure_line_leak_test') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_pressure_line_leak_test.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the pressure_line_leak_test"
                    exit $?
                fi
                '''
            }
        }
        stage('software_hardware_features') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_software_hardware_features.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the software_hardware_features"
                    exit $?
                fi
                '''
            }
        }
        stage('load_upgrade_version') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_load_upgrade_version.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load version"
                    exit $?
                fi
                '''
            }
        }
        stage('load_upgrade_version_check') {
            steps {
                sh '''
                sleep 300
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_load_upgrade_version_check.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load upgrade version check"
                    exit $?
                fi
                '''
            }
        }
        stage('inventory_after_upgrade') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_inventory_after_upgrade.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the inventory_after_upgrade"
                    exit $?
                fi
                '''
            }
        }
        stage('inventory_report_differences') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_inventory_report_differences.sh
                if [ $? -ge 0 ]; then
                    echo "Error in the inventory_report_differences"
                    exit $?
                fi
                '''
            }
        }
        stage('report_delivery_after_upgrade') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_delivery_after_upgrade.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the report_delivery_after_upgrade"
                    exit $?
                fi
                '''
            }
        }
        stage('delivery_report_differences') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_delivery_report_differences.sh
                if [ $? -ge 0 ]; then
                    echo "Error in the delivery_report_differences"
                    exit $?
                fi
                '''
            }
        }
        stage('revert_upgrade_version') {
            steps {
                sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_revert_upgrade_version.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load version"
                    exit $?
                fi
                '''
            }
        }
        stage('revert_upgrade_version_check') {
            steps {
                sh '''
                sleep 300
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_load_current_version_check.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script to load version"
                    exit $?
                fi
                '''
            }
        }
    }
    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
            sh '''
                cd /home/ubuntu04/Testarea
                pwd
                ls -al
                ./sk450p2_grep_errors.sh
                if [ $? -ne 0 ]; then
                    echo "Error in the script grep errors"
                    exit $?
                fi
                '''
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}
