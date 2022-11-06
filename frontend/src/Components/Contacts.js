import React, { useState } from 'react'
import { Box, Button, TextField } from "@mui/material";
import { Formik } from "formik";
import { useMediaQuery } from '@mui/material'
import Header from './Header';
import Navbar from './Navbar';

export default function Contacts() {

const isNonMobile = useMediaQuery("(min-width:600px)")

const [initialValues, setInitialValues] = useState({
    first_name: "",
    last_name: "",
    email: "",
    company: "",
    phone_number: "",
    address: "",
    notes: ""
})

const handleFormSubmit = (values, {resetForm} ) => {

let token = localStorage.getItem("token")
fetch("http://localhost:3000/contacts", {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
        token:token
    },
    body: JSON.stringify({
        first_name: values.first_name,
        last_name: values.last_name,
        email: values.email,
        company: values.company,
        phone_number: values.phone_number,
        address: values.address,
        notes: values.notes
    })
})
.then((res) => res.json())
resetForm()
}

    
return (
<>
<Navbar/>
<Box m="80px" >
    <Header title="Add a new contact" subtitle="You can update them later!" />
    <Formik 
    onSubmit={handleFormSubmit}
    initialValues={initialValues}
    >
    {({
    values,
    handleBlur,
    handleChange,
    handleSubmit,
    }) => (
    <form onSubmit={handleSubmit}>
        <Box
        display="grid"
        gap="30px"
        gridTemplateColumns="repeat(4, minmax(0, 1fr))"
        sx={{
        "& > div": { gridColumn: isNonMobile ? undefined : "span 4" },
        }}
        >
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="First Name"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.first_name}
        name="first_name"
        sx={{gridColumn: "span 2"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Last Name"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.last_name}
        name="last_name"
        sx={{gridColumn: "span 2"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Email"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.email}
        name="email"
        sx={{gridColumn: "span 4"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Company"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.company}
        name="company"
        sx={{gridColumn: "span 4"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Phone Number"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.phone_number}
        name="phone_number"
        sx={{gridColumn: "span 4"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Address"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.address}
        name="address"
        sx={{gridColumn: "span 4"}}
        />
        <TextField
        fullWidth
        variant="filled"
        type="text"
        label="Notes"
        onBlur={handleBlur}
        onChange={handleChange}
        value={values.notes}
        name="notes"
        sx={{gridColumn: "span 4"}}
        />
        </Box>
        <Box display="flex" justifyContent="end" mt="20px">
        <Button type="submit" color="secondary" variant="contained">
            Create a new contact
        </Button>
        </Box>
    </form>
    )}
    </Formik>
</Box>
<Box>
    
</Box>
</>
    )
}