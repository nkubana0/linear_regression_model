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

**[https://flutter-linear-regression.onrender.com/predict](https://flutter-linear-regression.onrender.com/predict)**

### How to Test the API
1. Open the **Swagger UI** at: [https://flutter-linear-regression.onrender.com/docs](https://flutter-linear-regression.onrender.com/docs).
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
Watch the video demo of the project here:  
[![YouTube Demo](https://youtu.be/zwiKEVy8YX8)]([https://www.youtube.com/watch?v=your_video_id](https://youtu.be/zwiKEVy8YX8))

---

## 📱 Mobile App Instructions
### Prerequisites
- Install **Python 3.9+**.
- Install the required dependencies:
    ```bash
    pip install -r requirements.txt
    ```

### Running the Mobile App
1. Navigate to the `summative/flutterapp` directory:
    ```bash
    cd summative/flutterapp
    ```
2. Run the app:
    ```bash
    flutter pub get
    flutter run
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
---

## 🛠️ Tech Stack
- **Backend**: FastAPI
- **Model**: Scikit-learn
- **Frontend**: Mobile app (Python-based)
- **Deployment**: Uvicorn, Cloud Hosting(Render)
