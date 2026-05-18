import express from 'express'
import cors from 'cors'
import morgan from 'morgan'
import { AppDataSource } from './db'
import { MovieRoute } from './routes/movie.route'
import { CinemaRoute } from './routes/cinema.route'
import { TimeTableRoute } from './routes/time.route'
import { configDotenv } from 'dotenv'
import { UserRoute } from './routes/user.route'
import { UserService } from './services/user.service'
import { InvoiceRoute } from './routes/invoice.route'

const app = express()
app.use(express.json())
app.use(cors())
app.use(morgan('combined'))

app.use(UserService.validateToken)
app.use('/api/movie', MovieRoute)
app.use('/api/cinema', CinemaRoute)
app.use('/api/time-table', TimeTableRoute)
app.use('/api/user', UserRoute)
app.use('/api/invoice', InvoiceRoute)

configDotenv()
const port = Number(process.env.SERVER_PORT)
AppDataSource.initialize().then(() => {
    console.log('Connected to database')
    app.listen(port, () => {
        console.log(`Application started on port ${port}`)
    })
})