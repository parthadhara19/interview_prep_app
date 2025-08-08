import '../models/question.dart';

class LocalQuestions {
  static List<Question> getQuestions() {
    return [
      // HR Questions
      Question(
        id: '1',
        question: 'Tell me about yourself.',
        answer: 'Start with your current role, highlight relevant experience, mention key achievements, and connect to the position you\'re applying for. Keep it concise (2-3 minutes) and professional. Focus on your professional journey, skills, and what makes you a good fit for this role.',
        category: 'HR',
        difficulty: 'Easy',
      ),
      Question(
        id: '2',
        question: 'What are your strengths?',
        answer: 'Choose 2-3 relevant strengths with specific examples. For example: "I\'m highly adaptable - in my previous role, I successfully transitioned our team to remote work during COVID-19, maintaining 100% productivity. I\'m also detail-oriented, which helped me catch critical bugs before production releases."',
        category: 'HR',
        difficulty: 'Easy',
      ),
      Question(
        id: '3',
        question: 'What are your weaknesses?',
        answer: 'Choose a real weakness that doesn\'t directly impact the job, and show how you\'re working to improve it. Example: "I used to struggle with public speaking, but I\'ve been taking presentation courses and volunteering to present in team meetings. I\'ve seen significant improvement."',
        category: 'HR',
        difficulty: 'Medium',
      ),
      Question(
        id: '4',
        question: 'Where do you see yourself in 5 years?',
        answer: 'Show ambition while staying realistic and aligned with the company. Example: "I see myself having grown significantly in technical expertise and taking on more leadership responsibilities. I\'d like to be mentoring junior developers and contributing to architectural decisions while continuing to deliver high-quality code."',
        category: 'HR',
        difficulty: 'Medium',
      ),
      Question(
        id: '5',
        question: 'Why do you want to work here?',
        answer: 'Research the company beforehand. Mention specific things about their products, culture, or mission that appeal to you. Example: "I\'m impressed by your company\'s commitment to innovation in fintech and the positive impact you\'re making on financial inclusion. The collaborative culture and emphasis on continuous learning align perfectly with my values."',
        category: 'HR',
        difficulty: 'Medium',
      ),
      Question(
        id: '6',
        question: 'Why are you leaving your current job?',
        answer: 'Stay positive and focus on growth opportunities. Never badmouth your current employer. Example: "I\'ve learned a lot in my current role, but I\'m looking for new challenges and opportunities to work with cutting-edge technologies. This position offers the perfect blend of technical growth and impact I\'m seeking."',
        category: 'HR',
        difficulty: 'Hard',
      ),

      // Technical Questions
      Question(
        id: '7',
        question: 'Explain Object-Oriented Programming and its principles.',
        answer: 'OOP is a programming paradigm based on objects containing data (attributes) and methods. The four main principles are:\n\n1. Encapsulation: Bundling data and methods that operate on that data within a single unit\n2. Inheritance: Creating new classes based on existing classes\n3. Polymorphism: Objects of different types can be treated as instances of the same type through a common interface\n4. Abstraction: Hiding complex implementation details while showing only essential features',
        category: 'Technical',
        difficulty: 'Medium',
      ),
      Question(
        id: '8',
        question: 'What is the difference between ArrayList and LinkedList in Java?',
        answer: 'ArrayList:\n- Uses dynamic array implementation\n- Fast random access O(1)\n- Slower insertion/deletion O(n) except at the end\n- Better for frequent read operations\n- Uses less memory per element\n\nLinkedList:\n- Uses doubly-linked list implementation\n- Slower random access O(n)\n- Faster insertion/deletion O(1) at any position\n- Better for frequent insertions/deletions\n- Uses more memory due to storing pointers',
        category: 'Technical',
        difficulty: 'Medium',
      ),
      Question(
        id: '9',
        question: 'Explain RESTful API principles.',
        answer: 'REST (Representational State Transfer) principles:\n\n1. Stateless: Each request contains all information needed to process it\n2. Client-Server Architecture: Separation of concerns\n3. Cacheable: Responses should be cacheable when appropriate\n4. Uniform Interface: Consistent way to interact with resources\n5. Layered System: Architecture can have multiple layers\n6. Code on Demand (optional): Server can send executable code\n\nUses standard HTTP methods (GET, POST, PUT, DELETE) and status codes.',
        category: 'Technical',
        difficulty: 'Hard',
      ),
      Question(
        id: '10',
        question: 'What is the difference between SQL and NoSQL databases?',
        answer: 'SQL Databases:\n- Structured data with predefined schema\n- ACID compliance\n- Complex queries with JOINs\n- Vertical scaling\n- Examples: MySQL, PostgreSQL\n\nNoSQL Databases:\n- Flexible schema or schema-less\n- Eventually consistent\n- Simple queries, no complex JOINs\n- Horizontal scaling\n- Types: Document (MongoDB), Key-Value (Redis), Column-family (Cassandra), Graph (Neo4j)',
        category: 'Technical',
        difficulty: 'Hard',
      ),
      Question(
        id: '11',
        question: 'Explain the concept of Big O notation.',
        answer: 'Big O notation describes the upper bound of algorithm complexity in terms of time or space as input size grows.\n\nCommon complexities:\n- O(1): Constant time\n- O(log n): Logarithmic time\n- O(n): Linear time\n- O(n log n): Linearithmic time\n- O(n²): Quadratic time\n- O(2^n): Exponential time\n\nIt helps compare algorithm efficiency and scalability.',
        category: 'Technical',
        difficulty: 'Medium',
      ),

      // Aptitude Questions
      Question(
        id: '12',
        question: 'If a train travels 120 km in 2 hours, what is its speed in km/h?',
        answer: 'Speed = Distance ÷ Time\nSpeed = 120 km ÷ 2 hours = 60 km/h\n\nThe train travels at 60 kilometers per hour.',
        category: 'Aptitude',
        difficulty: 'Easy',
      ),
      Question(
        id: '13',
        question: 'Complete the series: 2, 6, 12, 20, 30, ?',
        answer: 'Pattern: n(n+1) where n starts from 2\n- 2×3 = 6\n- 3×4 = 12\n- 4×5 = 20\n- 5×6 = 30\n- 6×7 = 42\n\nAnswer: 42',
        category: 'Aptitude',
        difficulty: 'Medium',
      ),
      Question(
        id: '14',
        question: 'A shopkeeper marks his goods 40% above cost price and gives a discount of 25%. Find his profit percentage.',
        answer: 'Let cost price = 100\nMarked price = 100 + 40% of 100 = 140\nDiscount = 25% of 140 = 35\nSelling price = 140 - 35 = 105\nProfit = 105 - 100 = 5\nProfit percentage = (5/100) × 100 = 5%',
        category: 'Aptitude',
        difficulty: 'Hard',
      ),
      Question(
        id: '15',
        question: 'If 5 men can complete a work in 12 days, how many days will 3 men take to complete the same work?',
        answer: 'Using the concept: Men × Days = Work\n5 men × 12 days = Total work\n60 man-days = Total work\n\nFor 3 men:\n3 men × ? days = 60 man-days\n? = 60 ÷ 3 = 20 days\n\nAnswer: 20 days',
        category: 'Aptitude',
        difficulty: 'Medium',
      ),
    ];
  }
}
