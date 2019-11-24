export const PORT = process.env.PORT ? process.env.PORT : 4000;
export const DOMAIN = process.env.DOMAIN ? process.env.DOMAIN : 'localhost:4000';
export const URL = process.env.DOMAIN ? `https://${process.env.DOMAIN}` : 'http://localhost:4000';