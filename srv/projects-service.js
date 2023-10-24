const cds = require('@sap/cds')
const log = cds.log('projects-service')

class ProjectsService extends cds.ApplicationService {
    
    init() {

        const { Projects } = cds.entities

        this.on('isStarted', async function onIsStarted(request) {
            log.info('on isStarted - request.data', request.data, 'request.params:', request.params)
            // Read the project from the db
            // if the start date is today or in the past then return true - else false
            const project = await SELECT.one.from(Projects).where({ID: request.data.project })
            const result = project.startDate < new Date()
            request.reply(result) 
        })

        this.on('endProject', async function onEndProject(request) {
            log.info('on endProject - request.data', request.data, 'request.params:', request.params)
            const result = await UPDATE(Projects).set({endDate: request.timestamp}).where({ID: request.data.project})
            if (result != 1) {
                return request.error('Unable to update Project')
            }
        })

        this.on('stop', 'Projects', async function onStopProjects(request) {
            log.info('on stop Projects - request.data', request.data, 'request.params:', request.params)
            const projectId = request.params[0]
            const endDate = request.data.endDate ? request.data.endDate : request.timestamp
            const result = await UPDATE(Projects).set({endDate: endDate }).where({ID: projectId })
            if (result != 1) {
                return request.error('Unable to update Project')
            }
        })

        this.on('hasStarted', 'Projects', async function onHasStartedProjects(request) {
            log.info('on hasStarted Projects - request.data', request.data, 'request.params:', request.params)
            const projectId = request.params[0]
            const project = await SELECT.one.from(Projects).where({ID: projectId })
            const result = project.startDate < request.timestamp
            request.reply(result)
        })

        this.on('hasEnded', 'Projects', async function onHasEndedProjects(request) {
            log.info('on hasEnded Projects - request.data', request.data, 'request.params:', request.params)
            const projectId = request.params[0]
            const project = await SELECT.one.from(Projects).where({ID: projectId })
            const result = project.endDate != undefined  && project.endDate < request.timestamp
            request.reply(result)
        })

        // Default Handlers for Create, Read, Update and Delete have before, after and on handlers

        this.before('READ', 'Projects', async function beforeReadProjects(request) {
            log.info('before READ Projects - request.data:', request.data, '- request.params:', request.params)
        })

        this.on('READ', 'Projects', async function onReadProjects(request, next) {
            log.info('on READ Projects - request.data:', request.data, '- request.params:', request.params)
            return next() // delegate it back to the CAP default handler
        })

        this.after('READ', 'Projects', async function beforeReadProjects(results, request) {
            log.info('after READ Projects - request.data:', request.data, '- request.params:', request.params)
            log.info('got ', results.length, 'results')
        })

        return super.init()
    }

  }
  
  module.exports = ProjectsService