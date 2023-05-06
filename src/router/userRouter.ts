import express from 'express';
import { UserBusiness } from '../business/UserBusiness';
import { UserDatabase } from '../database/UserDatabase';
import { IdGenerator } from '../services/IdGenerator';
import { TokenManager } from '../services/TokenManager';
import { HashManager } from '../services/HashManager';
import { UserController } from '../controller/UserController';

export const userRouter = express.Router()

const userController = new UserController(
    new UserBusiness(
        new UserDatabase(),
        new IdGenerator(),
        new HashManager(),
        new TokenManager()
    )
)

userRouter.post("/signup", userController.signup)