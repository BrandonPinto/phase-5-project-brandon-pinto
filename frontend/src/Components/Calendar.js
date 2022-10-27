import React, { useEffect, useState } from 'react'
import FullCalendar, { formatDate } from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import listPlugin from '@fullcalendar/list'
import { tokens } from '../Theme'
import Header from './Header'
import Navbar from './Navbar'


import {
    Box,
    List,
    ListItem,
    ListItemText,
    Typography,
    useTheme
} from "@mui/material"


export default function Calendar({ user, userCommunityEvents, userEvents, setUserEvents, setUserCommunityEvents }) {


    const theme = useTheme()
    const colors = tokens(theme.palette.mode)


    
        const getData = () => {
            if (user) {
            let token = localStorage.getItem("token")
            fetch(`http://localhost:3000/me`, {
                method: "GET",
                headers: {
                    token: token,
                    "Content-Type": "application/json"
                },
            }).then((res) => res.json())
                .then((data) => {
                    console.log(data)
                })
        }

    }

    const handleDateClick = (selected) => {
        // console.log(selected)
        const title = prompt("Please enter a new title for your event")
        const calendarApi = selected.view.calendar
        calendarApi.unselect()

        if (title !== "" && null)
            calendarApi.addEvent({
                id: `${selected.dateStr}-${title}`,
                title,
                start: selected.startStr,
                end: selected.endStr,
                allDay: selected.allDay
            })
        fetch("http://localhost:3000/personal_events/user", {
            method: "POST",
            headers: {
                "token": localStorage.getItem("token"),
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                title: title,
                start: selected.startStr,
                end: selected.endStr
            })

        }).catch(error => console.log(error))
    }



    const handleEventClick = (selected) => {
        if (
            window.confirm(
                `Are you sure you want to delete the event '${selected.event.title}?`
            )
        ) {
            selected.event.remove()
        }
    }

    return (
        <div>
            <Navbar />
            <Header title="Your Calendar" />
            <Box m="20px">

                <Box display="flex" justifyContent="space-between">
                    {/* profile component will go here */}
                    <Box className="invisible-scrollbar"
                        style={{
                            height: 675, display: 'flex', flexDirection: 'column', alignItems: 'center', overflowY: "scroll"
                        }}
                        flex="1 1 22%"
                        backgroundColor={colors.primary[400]}
                        p="5px"
                        borderRadius="5px"
                        scrollbarcolor={colors.primary[400]}
                    >
                        <Typography sx={{
                            textAlign: "center",
                            fontSize: "18px"
                        }}
                            variant="h5">Your Personal Events</Typography>
                        <List sx={{
                            width: "90%"
                        }}>
                            {userEvents.map((event) => (
                                <ListItem
                                    key={event.id}
                                    sx={{
                                        backgroundColor:
                                            colors.greenAccent[500],
                                        margin: "10px 0",
                                        borderRadius: "30px",
                                        padding: '4px 20px',
                                        textAlign: "center",
                                        wordWrap: "break-word",
                                        flex: "1 1 100%"
                                    }}
                                >
                                    {/* each item will contain each part of the users information 
                        based on what their events are-- change accordingly */}
                                    <ListItemText
                                        primary={
                                            <Typography sx={{
                                                marginTop: "-2px",
                                                fontSize: "14px",
                                                lineHeight: "1",
                                                marginBottom: "5px"
                                            }}>
                                                {event.title}
                                            </Typography>
                                        }


                                        secondary={
                                            <Typography sx={{
                                                fontSize: "10px",
                                                lineHeight: "0.5"
                                            }}>
                                                {formatDate(event.start, {
                                                    year: "numeric",
                                                    month: "short",
                                                    day: "numeric"
                                                })}
                                            </Typography>
                                        }
                                    />
                                </ListItem>
                            ))}
                        </List>
                    </Box>
                    <div className="space"></div>
                    <Box className="invisible-scrollbar"
                        style={{
                            height: 675, display: 'flex', flexDirection: 'column', alignItems: 'center', overflowY: "scroll"
                        }}
                        flex="1 1 22%"
                        backgroundColor={colors.primary[400]}
                        p="5px"
                        borderRadius="5px"
                        scrollbarcolor={colors.primary[400]}
                    >
                        <Typography sx={{
                            textAlign: "center",
                            fontSize: "18px"
                        }}
                            variant="h1">Your Community Events</Typography>
                        <List sx={{
                            width: "90%"
                        }}>
                            {userCommunityEvents.map((event) => (
                                <ListItem
                                    key={event.id}
                                    sx={{
                                        backgroundColor:
                                            colors.greenAccent[500],
                                        margin: "10px 0",
                                        borderRadius: "30px",
                                        padding: '4px 20px',
                                        textAlign: "center",
                                        wordWrap: "break-word",
                                        flex: "1 1 100%"
                                    }}
                                >
                                    {console.log("hello world")}
                                    {/* each item will contain each part of the users information 
                        based on what their events are-- change accordingly */}
                                    <ListItemText
                                        primary={
                                            <Typography sx={{
                                                marginTop: "-2px",
                                                fontSize: "14px",
                                                lineHeight: "1",
                                                marginBottom: "5px"
                                            }}>
                                                {event.title}
                                            </Typography>
                                        }
                                        secondary={
                                            <Typography sx={{
                                                fontSize: "10px",
                                                lineHeight: "0.5"
                                            }}>
                                                {formatDate(event.start, {
                                                    year: "numeric",
                                                    month: "short",
                                                    day: "numeric"
                                                })}
                                            </Typography>
                                        }
                                    />
                                </ListItem>
                            ))}
                        </List>
                    </Box>
                    {/* {CALENDAR} */}
                    <Box flex="1 1 100%" ml="40px">
                        {/* CALENDAR */}
                        <FullCalendar
                            flex="1 1 100%"
                            height="75vh"
                            plugins={[
                                dayGridPlugin,
                                timeGridPlugin,
                                interactionPlugin,
                                listPlugin
                            ]}
                            sx={{}}
                            headerToolbar={{
                                left: "prev,next today",
                                center: "title",
                                right: "dayGridMonth,timeGridWeek,timeGridDay,listMonth"
                            }}
                            initialView="dayGridMonth"
                            editable={true}
                            selectable={true}
                            selectMirror={true}
                            dayMaxEvents={true}
                            select={handleDateClick}
                            eventClick={handleEventClick}
                            events={{ getData() { }}}

                        />
                    </Box>
                </Box>
            </Box>
        </div>
    )
}
