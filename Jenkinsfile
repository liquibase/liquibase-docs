#!/usr/bin/env groovy

// This uses resolveScm to determine if this branch exists in the build-logic repo
def buildLogicSCM = resolveScm source: [$class: 'GitSCMSource', credentialsId: 'ba0e0f7c-180a-48c2-a313-9cab17d0188f', 
    excludes: '', id: '_', ignoreOnPushNotifications: false, includes: '*', traits: [[$class: 'jenkins.plugins.git.traits.BranchDiscoveryTrait']],
    remote: 'git@github.com:Datical/build-logic.git'], targets: ["$BRANCH_NAME", 'master']

def buildLogicBranchName = buildLogicSCM.branches[0].name

library "build-logic@$buildLogicBranchName"

promoteLiquibaseDocs()