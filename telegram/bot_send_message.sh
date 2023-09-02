#
# Copyright (C) 2023 Dhina17 <dhinalogu@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# To which chat, bot should send message
CHAT_ID=""
# Content of the message
TEXT=""
# Your bot API key. Get from BotFather bot.
BOT_API_KEY=""

# Send Message
curl -F chat_id=$CHAT_ID -F text="$TEXT" -F disable_web_page_preview=true https://api.telegram.org/bot${BOT_API_KEY}/sendMessage
