import React, { useState } from 'react'

const ChatInput = () => {

    const [chatInput, setChatInput] = useState("")

    const handleSubmit = (e) => {
        e.preventDefault();
        if (chatInput !== "") {
            fetch(`/api/users/${user.id}/create_message`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    sender_id: user.id,
                    receipient_id: receipient.id,
                    content: chatInput
                })
            })
            .then((r) => {
                if (r.ok) {
                    r.json().then((data) => {
                        setChatInput("")
                        setMessages([...messages, data])
                    })
                }
            })
        }
    }


  return (
    <div>
      
    </div>
  )
}

export default ChatInput
