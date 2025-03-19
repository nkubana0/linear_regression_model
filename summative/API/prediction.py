from fastapi import FastAPI, HTTPException
import joblib
import numpy as np
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

# Load the trained model and scaler
model = joblib.load("model.pkl")
scaler = joblib.load("scaler.pkl")

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Updated Pydantic model (added GradeClass)
class StudentData(BaseModel):
    Age: int
    Gender: int
    Ethnicity: int
    ParentalEducation: int
    StudyTimeWeekly: float
    Absences: int
    Tutoring: int
    ParentalSupport: int
    Extracurricular: int
    Sports: int
    Music: int
    Volunteering: int
    GradeClass: int  # ✅ Added new feature

@app.post("/predict")
def predict_gpa(data: StudentData):
    try:
        # Ensure all 13 features are included
        input_data = np.array([[
            data.Age, data.Gender, data.Ethnicity, data.ParentalEducation,
            data.StudyTimeWeekly, data.Absences, data.Tutoring,
            data.ParentalSupport, data.Extracurricular, data.Sports,
            data.Music, data.Volunteering, data.GradeClass  # ✅ Include GradeClass
        ]])

        # Transform input using the scaler
        input_scaled = scaler.transform(input_data)

        # Make the prediction
        predicted_gpa = model.predict(input_scaled)[0]
        
        return {"Predicted GPA": round(predicted_gpa, 2)}
    except Exception as e:
        print("Error during prediction:", e)
        raise HTTPException(status_code=500, detail=str(e))
