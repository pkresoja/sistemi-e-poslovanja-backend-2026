import { Router } from "express";
import { defineRequest } from "../utils";
import { CinemaService } from "../services/cinema.service";

export const CinemaRoute = Router()

CinemaRoute.get('/', async (req, res) => {
    await defineRequest(res, async () => {
        return await CinemaService.getAll()
    })
})

CinemaRoute.get('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        return await CinemaService.getByIdSimple(id)
    })
})

CinemaRoute.post('/', async (req, res) => {
    await defineRequest(res, async () => {
        await CinemaService.create(req.body)
    })
})

CinemaRoute.put('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        await CinemaService.update(id, req.body)
    })
})

CinemaRoute.delete('/:id', async (req, res) => {
    await defineRequest(res, async () => {
        const id = Number(req.params.id)
        await CinemaService.removeById(id)
    })
})