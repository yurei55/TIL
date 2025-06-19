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
      progress: 100,
    },
    {
      id: "2",
      name: "기본 앱 구조 개발",
      start: "2025-05-08",
      end: "2025-05-21",
      progress: 100,
    },
    {
      id: "3",
      name: "회원가입/로그인 기능 구현",
      start: "2025-05-22",
      end: "2025-06-08",
      progress: 90,
    },
    {
      id: "4",
      name: "위치 기반 서비스/지도 기능",
      start: "2025-06-05",
      end: "2025-06-22",
      progress: 80,
    },
    {
      id: "5",
      name: "북마크 기능",
      start: "2025-06-10",
      end: "2025-06-22",
      progress: 20,
    },
    {
      id: "6",
      name: "리뷰 기능",
      start: "2025-06-14",
      end: "2025-06-22",
      progress: 20,
    },
    {
      id: "7",
      name: "피드 기능",
      start: "2025-06-17",
      end: "2025-06-22",
      progress: 20,
    },
    {
      id: "8",
      name: "내정보 기능",
      start: "2025-06-22",
      end: "2025-06-23",
      progress: 20,
    },
    {
      id: "9",
      name: "최종 수정 및 배포 준비",
      start: "2025-06-22",
      end: "2025-06-25",
      progress: 0,
    },
  ];

  const ganttRef = useRef(null);

  useEffect(() => {
    if (ganttRef.current) {
      new Gantt(ganttRef.current, tasks, {
        view_mode: "Week",
        language: "ko",
      });
    }
  }, []);

  return <div ref={ganttRef}></div>;
};

export default GanttChart;
