import { Router } from "express";
import { defineRequest } from "../utils";
import { TimeTableService } from "../services/time.service";

export const TimeTableRoute = Router()

TimeTableRoute.get('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        return await TimeTableService.getById(id)
    })
})

TimeTableRoute.post('/', async (req, res) => {
    await defineRequest(res, async () => {
        return await TimeTableService.create(req.body)
    })
})

TimeTableRoute.put('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        return await TimeTableService.update(id, req.body)
    })
})

TimeTableRoute.delete('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        return await TimeTableService.deleteById(id)
    })
})