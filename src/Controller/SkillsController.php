<?php

namespace App\Controller;

use App\Entity\Skills;
use App\Form\SkillsType;
use App\Repository\SkillsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/skills")
 */
class SkillsController extends AbstractController
{
    /**
     * @Route("/", name="skills_index", methods={"GET"})
     */
    public function index(SkillsRepository $skillsRepository): Response
    {

        if (!$this->getUser()) {
            return $this->redirectToRoute('app_login');
        }
        return $this->render('skills/index.html.twig', [
            'skills' => $skillsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="skills_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {

        if (!$this->getUser()) {
            return $this->redirectToRoute('app_login');
        }

        $skill = new Skills();
        $form = $this->createForm(SkillsType::class, $skill);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($skill);
            $entityManager->flush();

            return $this->redirectToRoute('skills_index');
        }

        return $this->render('skills/new.html.twig', [
            'skill' => $skill,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id<\d+>}", name="skills_show", methods={"GET"})
     */
    public function show(Skills $skill): Response
    {

        if (!$this->getUser() || ($this->getUser()->getId() != $skill->getUserId()->getId())) {
            return $this->redirectToRoute('app_login');
        }
        return $this->render('skills/show.html.twig', [
            'skill' => $skill,
        ]);
    }

    /**
     * @Route("/{id<\d+>}/edit", name="skills_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Skills $skill): Response
    {

        if (!$this->getUser() || ($this->getUser()->getId() != $skill->getUserId()->getId())) {
            return $this->redirectToRoute('app_login');
        }
        $form = $this->createForm(SkillsType::class, $skill);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('skills_index');
        }

        return $this->render('skills/edit.html.twig', [
            'skill' => $skill,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id<\d+>}", name="skills_delete", methods={"POST"})
     */
    public function delete(Request $request, Skills $skill): Response
    {
        if ($this->isCsrfTokenValid('delete' . $skill->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($skill);
            $entityManager->flush();
        }

        return $this->redirectToRoute('skills_index');
    }
}
