import z from 'zod'

export interface LikeOrDislikePostInputDTO {
    like: boolean,
    postId: string,
    token: string,
}

export type LikeOrDislikePostOutputDTO = undefined

export const LikeOrDislikePostSchema = z.object ({
    like: z.boolean(),
    postId: z.string().min(1),
    token: z.string().min(1),
})