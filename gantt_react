import React, { useEffect, useRef } from "react";
import Gantt from "frappe-gantt";
import "frappe-gantt/dist/frappe-gantt.css";

const GanttChart = () => {
  const tasks = [
    {
      id: "1",
      name: "요구사항 정의 및 화면 설계",
      start: "2025-05-01",
      end: "2025-05-07",
      progress: 100
    },
    {
      id: "2",
      name: "기본 앱 구조 개발",
      start: "2025-05-08",
      end: "2025-05-21",
      progress: 100
    },
    {
      id: "3",
      name: "회원가입/로그인 기능 구현",
      start: "2025-05-22",
      end: "2025-06-04",
      progress: 80
    },
    {
      id: "4",
      name: "위치 기반 서비스/지도 기능",
      start: "2025-06-05",
      end: "2025-06-11",
      progress: 60
    },
    {
      id: "5",
      name: "커뮤니티 기능",
      start: "2025-06-12",
      end: "2025-06-18",
      progress: 0
    },
    {
      id: "6",
      name: "최종 수정 및 배포 준비",
      start: "2025-06-19",
      end: "2025-06-25",
      progress: 0
    },
  ];

  const ganttRef = useRef(null);

  useEffect(() => {
    if (ganttRef.current) {
      new Gantt(ganttRef.current, tasks, {
        view_mode: "Week",
        language: "ko"
      });
    }
  }, []);

  return <div ref={ganttRef}></div>;
};

export default GanttChart;
