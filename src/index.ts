require("dotenv/config");

const token = process.env.BOT_TOKEN;

if (!token) throw new Error("Missing BOT_TOKEN");

console.log(token);
