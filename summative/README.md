# Student GPA Prediction

## 🛠️ Mission
To build a predictive model that estimates a student's GPA based on demographic and behavioral factors.

## 📊 Dataset Description
- **Source**: [Kaggle - Student Performance Dataset](https://www.kaggle.com/datasets/rabieelkharoua/students-performance-dataset/data)
- **Size**: Approx. X records, Y features
- **Features**:
    - `Age`: Age of student (int)
    - `Gender`: 0 = Female, 1 = Male
    - `Ethnicity`: Encoded categories of ethnicity (int)
    - `ParentalEducation`: Educational background of the student's parent (int)
    - `StudyTimeWeekly`: Average hours of weekly study (float)
    - `Absences`: Number of school absences (int)
    - `Tutoring`: Whether student attends tutoring (binary)
    - `ParentalSupport`: Level of parental involvement (int)
    - `Extracurricular`: Participation in extracurricular activities (binary)
    - `Sports`, `Music`, `Volunteering`: Involvement in specific activities (binary)
    - `GradeClass`: Academic grade level (int)
    - `GPA`: Final Grade Point Average (target)

## 📈 Goal
Predict the **GPA** of a student based on these features.

---

## 🌐 Public API Endpoint
The API is deployed and publicly accessible at:

**[https://your-api-url.com/predict](https://your-api-url.com/predict)**

### How to Test the API
1. Open the **Swagger UI** at: [https://your-api-url.com/docs](https://your-api-url.com/docs).
2. Use the `/predict` endpoint to send a POST request with the following JSON structure:
    ```json
    {
        "Age": 16,
        "Gender": 1,
        "Ethnicity": 2,
        "ParentalEducation": 3,
        "StudyTimeWeekly": 10.5,
        "Absences": 4,
        "Tutoring": 1,
        "ParentalSupport": 2,
        "Extracurricular": 1,
        "Sports": 0,
        "Music": 1,
        "Volunteering": 0,
        "GradeClass": 11
    }
    ```
3. The API will return a prediction in the following format:
    ```json
    {
        "Predicted GPA": 3.75
    }
    ```

---

## 📹 YouTube Demo
Watch the 2-minute demo of the project here:  
[![YouTube Demo](https://img.youtube.com/vi/your_video_id/0.jpg)](https://www.youtube.com/watch?v=your_video_id)

---

## 📱 Mobile App Instructions
### Prerequisites
- Install **Python 3.9+**.
- Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

### Running the Mobile App
1. Navigate to the `mobile_app/src` directory:
    ```bash
    cd mobile_app/src
    ```
2. Run the app:
    ```bash
    python main.py
    ```
3. Open the app on your mobile device or emulator to interact with the GPA prediction feature.

---

## 🚀 Deployment Instructions
To deploy the API:
1. Clone the repository:
    ```bash
    git clone https://github.com/your-repo/linear_regression_model.git
    cd linear_regression_model/summative/API
    ```
2. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
3. Run the API using `uvicorn`:
    ```bash
    uvicorn prediction:app --host 0.0.0.0 --port 8000
    ```
4. Deploy to a cloud platform (e.g., AWS, Heroku, or Google Cloud) for a publicly routable URL.

---

## 🛠️ Tech Stack
- **Backend**: FastAPI
- **Model**: Scikit-learn
- **Frontend**: Mobile app (Python-based)
- **Deployment**: Uvicorn, Cloud Hosting