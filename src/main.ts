import express from "express";

const SERVER_PORT = process.env.PORT;

const application = express();

application.get("/", (_, res) => {
  res.status(200).send("FIM - OIDC Provider");
});

application.listen(SERVER_PORT, () => {
  console.log(`Application started on port ${SERVER_PORT}`);
});
