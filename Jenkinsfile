pipeline {
    agent any

    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'master', description: '选择分支名称')
        string(name: 'NODE_ENV', defaultValue: 'production', description: '测试环境填 test, 生产环境填 production')
        booleanParam(name: 'SNAPSHOT', defaultValue: false, description: '为测试环境添加 -SNAPSHOT 后缀')
    }

    environment {
        REPO_URL = "git@github.com:bxm0927/vue-demo.git"
        BRANCH_NAME = "${BRANCH_NAME}"
        PULL_KEY = "xiaoming.bai"
        // ALIYUN_DOCKER_CREDENTIALS = "ef67d595-5140-43c3-990b-a6e18e8a8bf3"
        // ALIYUN_DOCKER_REGISTRY = 'https://registry-vpc.cn-shanghai.aliyuncs.com'
    }

    stages {
        stage('Pull Code') {
            steps {
                echo "====++++ Pulling Code ++++===="
                git branch: "${BRANCH_NAME}", url: "${REPO_URL}", credentialsId: "${PULL_KEY}"
                echo "代码git地址：" + "${REPO_URL}"
                echo "分支名称：" + "${BRANCH_NAME}"
            }
        }

        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Deliver') {
            steps {
                sh 'serve'
            }
        }
    }
}
