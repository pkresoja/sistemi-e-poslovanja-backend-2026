import { DataSource } from "typeorm";
import { Cinema } from "./entities/Cinema";
import { Invoice } from "./entities/Invoice";
import { InvoiceItem } from "./entities/InvoiceItem";
import { TimeTable } from "./entities/TimeTable";
import { User } from "./entities/User";

export const AppDataSource = new DataSource({
    type: 'mysql',
    host: 'localhost',
    port: 3309,
    username: 'root',
    password: 'root',
    database: 'psep_2026',
    entities: [User, Cinema, TimeTable, InvoiceItem, Invoice]
})