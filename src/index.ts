require("dotenv/config");
import TelegramBot from "node-telegram-bot-api";
import { NlpManager } from "node-nlp";
import { controller } from "./controller";
import { dataset } from "./datasetNlp";

const token = process.env.BOT_TOKEN;

if (!token) throw new Error("Missing BOT_TOKEN");

const manager = new NlpManager({ languages: ["pt"], forceNER: true });
const bot = new TelegramBot(token, { polling: true });

dataset.map((data) =>
  manager.addDocument(data.language, data.text, data.definition)
);

manager.addAnswer("pt", "GREET", "Olá, qual sua duvida?");
manager.addAnswer("pt", "LOCATION", "Rua tal");
manager.addAnswer("pt", "ENDING", "Até logo");

(async () => {
  manager.train();
  manager.save();

  bot.on("text", async (msg: TelegramBot.Message) => {
    const response = await manager.process("pt", msg.text?.toLowerCase());
    if (!response.answer && msg.text) {
      controller.nlpDoubtRegister(msg.text.toLowerCase());
      bot.sendMessage(
        msg.chat.id,
        "Desculpe, não entendi você poderia escrever de outra forma?"
      );
      return;
    }
    bot.sendMessage(msg.chat.id, response.answer);
  });
})();
