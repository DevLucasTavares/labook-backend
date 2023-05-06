import { UserDatabase } from "../database/UserDatabase";
import { HashManager } from "../services/HashManager";
import { IdGenerator } from "../services/IdGenerator";
import { TokenManager } from "../services/TokenManager";

export class UserBusiness {
    constructor (
        private userDatabase: UserDatabase,
        private idGenerator: IdGenerator,
        private hashManager: HashManager,
        private tokenManager: TokenManager
    ) {}
}