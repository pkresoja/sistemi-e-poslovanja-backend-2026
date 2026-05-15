import { Router } from "express";
import { defineRequest } from "../utils";
import { UserService } from "../services/user.service";

export const UserRoute = Router()

UserRoute.post('/signup', async (req, res) => {
    await defineRequest(res, async () => {
        return await UserService.createAccount(req.body)
    })
})

UserRoute.put('/verify/:code', async (req, res) => {
    await defineRequest(res, async () => {
        const code = Number(req.params.code)
        return await UserService.verifyAccount(code)
    })
})

UserRoute.post('/login', async (req, res) => {
    await defineRequest(res, async () => {
        return await UserService.login(req.body)
    })
})