db.inspections.aggregate([
{'$match':{'timestamps.processedAt': {
                                 '$gte': new Date('2023-11-20T00:00:00'),
                                 '$lte': new Date('2023-11-21T00:00:00')

                             },

                   'host.license':{'$in':['A270920181900-02333',
                                           'A270920181900-02332',
                                           'A270920181900-02334',
                                           'A270920181900-04385',
                                           'A270920181900-05944',
                                           'A270920181900-05922',
                                           'A270920181900-02236',
                                           'A270920181900-01380',
                                           'A270920181900-03151',
                                           'A270920181900-03777',
                                           'A270920181900-04451',
                                           'A270920181900-04452',
                                           'A270920181900-05945',
                                           'A270920181900-06821',
                                           'A270920181900-03101',
                                           'A270920181900-06819',
                                           'A270920181900-04429',
                                           'A270920181900-06822',
                                           'A270920181900-06823',
                                           'A270920181900-06818',
                                           'A270920181900-04428',
                                           'A270920181900-06820',
                                           'A270920181900-06824',
                                           'A270920181900-01379',
                                           'A270920181900-03764',
                                           'A270920181900-03768',
                                           'A270920181900-03769',
                                           'A270920181900-03766',
                                           'A270920181900-03765',
                                           'A270920181900-03767']},

                    'isTest': false,
                    'resolvedBy.type': 'human',
                    'steps.type': {'$in' : ['alcohol.short', 'alcohol.long']}}},

{'$project':{'organization_name': '$organization.name',
                                                                  'organization_id': '$organization.id',
                                                                  'host_id': '$host.id',
                                                                  'host_license': '$host.license',
                                                                  'host_releasePoint_address': '$host.releasePoint.address',
                                                                  'resolution_success': '$resolution.success',
                                                                  'resolution_remarks': '$resolution.remarks',
                                                                  'timestamps_finishedAt':'$timestamps.finishedAt',
                                                                  'timestamps_startedAt':'$timestamps.startedAt',
                                                                  'total':{
                                                                                  '$dateDiff': {
                                                                                    'startDate': '$timestamps.startedAt',
                                                                                    'endDate': '$timestamps.finishedAt',
                                                                                    'unit': 'second'
                                                                                  }
                                                                                },
                                                                   'resolution_remarks':'$resolution.remarks',
                                                                   'resolution_success':'$resolution.success'}},


{'$group':{

'_id':{'organization_name': '$organization_name',
                                                                         'organization_id': '$organization_name',
                                                                         'host_id': '$host_id',
                                                                         'host_license': '$host_license',
                                                                         'host_releasePoint_address': '$host_releasePoint_address'},





'avg_total':{'$avg':'$total'}



}},

{
                '$project': {
                    '_id': 0, // Исключить поле _id из вывода
                    'organization_name': '$_id.organization_name',
                    'organization_id': '$_id.organization_id',
                    'host_id': '$_id.host_id',
                    'host_license': '$_id.host_license',
                    'host_releasePoint_address': '$_id.host_releasePoint_address',
                    'avg_total': '$avg_total',


         
                }
            }

])

$$ language plpgsql;


