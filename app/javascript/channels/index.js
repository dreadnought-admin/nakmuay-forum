// Import all the channels to be used by Action Cable
import "channels/chats_channel"
import "channels/messages_channel"

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)