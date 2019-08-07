import * as express from 'express';
import { value } from '@cantor/common';

const app = express()
const port = 3000

app.get('/', (req, res) => res.send(`${value} from node!`))

app.listen(port, () => console.log(`Example app listening on port ${port}!`))