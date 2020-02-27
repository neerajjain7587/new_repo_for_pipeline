node {
    checkout scm
    def customImage = docker.build("my-image","./dockerfiles")
    customImage.push()
}
