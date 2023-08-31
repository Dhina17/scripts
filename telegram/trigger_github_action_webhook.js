/*
 * Copyright (C) 2023 Dhina17 <dhinalogu@gmail.com>
 *
 * SPDX-License-Identifier: Apache-2.0
 */

addEventListener("fetch", event => {
    event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
    if (request.method === "POST") {
        const payload = await request.json();
        // console.log(payload);
        // Getting the POST request JSON payload
        const chatId = payload.message.chat.id
        // Message we received
        const cmd = payload.message.text
        if ('message' in payload && 'text' in payload.message && `${CHAT_ID}` == chatId && cmd == "/build@DhinaTheBot") {
            console.log(`BOT: ChatID - ${chatId}`)
            console.log(`BOT: Text - ${cmd}`)
            // console.log("A fine request");
            // Trigger github repo for action
            const result = await fetch(`https://api.github.com/repos/Dhina17/${REPO_NAME}/dispatches`, {
                method: "POST",
                body: JSON.stringify({
                    event_type: "Build App - Release [Bot]"
                }),
                headers: {
                    "authorization": `token ${GITHUB_TOKEN}`,
                    'user-agent': 'cloudfare-webhook'
                },
            });

            var text = "Don't know"
            // Github API request returns 204 (No content)
            if (result.status == 204) {
                text = "Build started!"
            } else {
                text = "Failed to start. Start manually!"
            }
            // Send reply to the telegram.
            const url = `https://api.telegram.org/bot${API_KEY}/sendMessage?chat_id=${chatId}&text=${text}`
            const data = await fetch(url);
        }
    }
    // Important to notify the telegram that we consumed the updates.
    // Otherwise Telegram will push older updates again and again.
    return new Response("OK") 
}
