-- Made by Alex Zverev (@alwye on Github/@Stroopbroodje on Roblox)
-- Watch demo: https://youtu.be/8GcmlzZdgss

-- Step 1. Install telegram unless you have it: https://telegram.org
-- Step 2. Message @BotFather to create a new bot. Take note of the access token
-- Step 3. Text something to your bot, otherwise it won't be able to send you messages
-- Step 4. In Roblox Studio, go to file -> Game settings -> Security -> Enable "Allow HTTP requests"
-- Step 5. Create a new script under Workspace and copy the content of this file there
-- Step 6. Change the configuration values below
-- Step 7. Save and publish your game! Test it out.

-- Load services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Configuration
local telegramToken = "" -- You should get your token at step 2
local telegramRecipient = "" -- Message to @chatid_echo_bot on Telegram to get your account ID
local gameName = "" -- Name your game something so that if you get notifications from multiple games

Players.PlayerAdded:Connect(function(player)
	local telegramUrl = "https://api.telegram.org/bot" .. telegramToken .. "/" .. "sendMessage"
	local message = player.DisplayName .. " has just joined your game " .. gameName .. ". Profile: https://www.roblox.com/users/".. player.UserId .."/profile"
	local payloadData = {
		["chat_id"]=telegramRecipient,
		["text"]=message
	}
	HttpService:PostAsync(telegramUrl, HttpService:JSONEncode(payloadData))
end)
