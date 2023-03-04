import React, { useState, useEffect, useRef } from 'react'
import ChatInput from './ChatInput'

const Chat = () => {

    useEffect(() => {
        if(user.id) {
            fetch(`/api/users/${user.id}/message_history`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    sender_id: user.id,
                    receipient_id: receipient.id,
                })
            })
            .then((r) => {
                if (r.ok) {
                    r.json().then((data) => {
                        setMessages(data)
                        setPairId(data[0]['pair_id'])
                    })
                }
            })
        }
    }, [user.id, receipient.id, setMessages])

    useEffect(() => {
        if(user.id) {
            cable.subscriptions.create(
                {
                    channel: 'ChatsChannel',
                    user_id: user.id,
                    receipient_id: receipient.id
                },
                {
                    received: (message) => {
                        setMessages([...messages, message])
                    }
                }
            )
        }
    }, [user.id, cable.subscriptions, receipient.id, setMessages, messages])

  return (
    <div>
      
    </div>
  )
}

export default Chat
